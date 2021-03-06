# Copyright (C) 2018 Zentyal S.L.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# Class: EBox::Samba::Types::DownloadExportUsers;
#
use strict;
use warnings;

package EBox::Samba::Types::DownloadExportUsers;

use base 'EBox::Types::Link';

sub new
{
    my $class = shift;
    my %opts = @_;
    $opts{'type'} = 'status';
    my $self = $class->SUPER::new(%opts);
    bless($self, $class);
    return $self;
}

# Method: volatile
#
#   Overrides <EBox::Types::Basic::volatile>.
#
sub volatile
{
    my ($self) = @_;

    return 1;
}

# Method: editable
#
#   Overrides <EBox::Types::Basic::editable>.
#
sub editable
{
    my ($self) = @_;

    return 0;
}

# Method: optional
#
#   Overrides <EBox::Types::Basic::optional>.
#
sub optional
{
    my ($self) = @_;

    return 1;
}

# Method: value
#
#   Overrides <EBox::Types::Basic::value>.
#
sub value
{
    my ($self) = @_;

    if (-f '/var/lib/zentyal/tmp/.users_exporter-running') {
        return 'in-progress';
    } else {
        my $csv = '/tmp/users-export.csv';
        if (-f $csv) {
            return 'available';
        } else {
            return 'noreport';
        }
    }
}

# Method: printableValue
#
#   Overrides <EBox::Types::Basic::printableValue>.
#
sub printableValue
{
    my ($self) = @_;

    return $self->value();
}

# Method: restoreFromHash
#
#   Overrides <EBox::Types::Basic::restoreFromHash>
#
sub restoreFromHash
{

}

# Method: storeInHash
#
#   Overrides <EBox::Types::Basic::storeInHash>
#
sub storeInHash
{

}

# Method: HTMLViewer
#
#   Overrides <EBox::Types::Basic::HTMLViewer>
#
sub HTMLViewer
{
    return '/samba/downloadExportUsersViewer.mas';
}

1;
