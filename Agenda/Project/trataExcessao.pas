unit trataExcessao;

interface

type
  TException = class
    private
    public
      constructor Create;
      procedure TrataException(Sender : TObject; E : Exception);

  end;

implementation

end.
