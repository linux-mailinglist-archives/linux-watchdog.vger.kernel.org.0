Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD8610EC27
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 16:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfLBPRT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 10:17:19 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.66]:45646 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfLBPRT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 10:17:19 -0500
Received: from [46.226.52.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-west-1.aws.symcld.net id DA/C4-09012-BFA25ED5; Mon, 02 Dec 2019 15:17:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIJsWRWlGSWpSXmKPExsWSoc9jqvtL62m
  swZbJaharpu5ksbixbh+7xZOFZ5gsPuy6ymzx+OU/ZgdWj5Vr1rB69P818Nj5vYHd4/MmuQCW
  KNbMvKT8igTWjC+3p7IVzBGt6F76irWB8QF/FyMnB6PAUmaJA4/Vuxi5gOxjLBJT7+5lhnA2M
  0r87v3JBlLFInCCWeLBX1eQhJDAVCaJyZtXM0E4DxglVhy6BlbFJmAhMfnEAzBbRCBe4vjcs2
  CjmAXamCQ2HHvECJIQFrCX2Pp3CVSRg8SyB5/ZIexsiQk9b5kg1qlI7PqwlAXE5hVIlPjQ9Bt
  q230WiabVD4AGcXBwCthK7GiXgXhCVuJL42pmEJtZQFzi1pP5YHMkBAQkluw5zwxhi0q8fPyP
  FaI+VeJk0w1GiLiOxNnrT6BsJYl5c49A2bISl+Z3g62SEPCVmLUwCqb83JGp7BC2hcSS7lYWi
  BIViX+HKiHCBRJPv86BmqImMWX9J2aIEhmJnT+NQR6REHjNKvFjSh/rBEb9WUiOhrB1JBbs/s
  QGYWtLLFv4mnkWOCAEJU7OfMKygJFlFaN5UlFmekZJbmJmjq6hgYGuoaGRrqGlma6RgV5ilW6
  SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYGpKKTgisoNxwre3eocYJTmYlER5/35+EivE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgvet6tNYIcGi1PTUirTMHGCahElLcPAoifCu0gRK8xYXJ
  OYWZ6ZDpE4x6nJMeDl3EbMQS15+XqqUOC8LSJEASFFGaR7cCFjKvsQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmFcIZApPZl4J3KZXQEcwAR1h3vII5IiSRISUVAOT7/XdD9y+b0xiLuo1nF5
  1WdsjtvbLxP7uhNIjkfGnJCP2sUy0fF66b9OSoiu35vt5qGqJ7l22tlfs+EFtN5b2Mhv+c72u
  pUKlVhvd/u52f/PnQljktyOT3zfMMVXVcqy3PPb+7/n/GjKF7Sdv87LxPOIOD1tp21cl+Nln5
  99vAZ0MRe3BMnt1hRd9EBDL86g0jLKbvnXbYXvVeL5lslEqCxkrpu5gXRyRLlz4ac1jCZ3N5f
  dLn39XFtXOsxLy1WC+rCA8e+e00i5d5w8Rvrd+Gq1VnWs1seKN4suJtf7vt0bs7uE4tMEy16o
  s5ZH9VfmzWsX9OSuXn86tzhdYM+XMnquzstryDv432r8of5ESS3FGoqEWc1FxIgBj70XWVAQA
  AA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-17.tower-288.messagelabs.com!1575299834!776737!1
X-Originating-IP: [104.47.12.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17147 invoked from network); 2 Dec 2019 15:17:14 -0000
Received: from mail-db3eur04lp2053.outbound.protection.outlook.com (HELO EUR04-DB3-obe.outbound.protection.outlook.com) (104.47.12.53)
  by server-17.tower-288.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 15:17:14 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOvdfWyokBzjDidlGqEiMirrzSHbAuTdOZoPzPGUpqT0G8S2pr50DCgw1AdlV43/VyruYhSybkGOVQMV7yHFxkeA99cmJB55vSqNgCfxWd1UaKg+e3gYArDEZHlBMkgaXOJ/Hqpm2BEf89z49ye/THP8xIo6gStOck2szK7B4jpdEjl05XzgWPdbvXtOpBowSMtr3JFKsaZaUzJo45qyjS99Op2mAWp7zZCO660KKqsoabG7YRgJE5iqgcd6ZATwVOni81nn2I8ISIyXsYtgGNV0dIIYF4FvCythBRcQPyPJLDNtXtCInXFjC+9CEV/OTeUJ7nBZaHVUeP6QbPczWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81cAw3WgnAy2it+flwapr8vUf7vKk/Ux2Gl0K9lN9L0=;
 b=XFG1YigFhUAQvYJg/tNQiqV7oJXi28JjFiOw6TsmgBndu1k362ATqt0Hf79fUCmjoZYROEwg9kfgTLXN5wi7m96FNZmh3IQ114bxEvOb2KlvW8W5v9LtxnoXQMd7b3JqN49j1W0UyTr4MBFVOXCoBg9jjYeIjjFs+2rDK1HsOPj82Llmr+M3adGXxohDLGt8J7wDot2od6C2UgXYTk0iCo5MJe5YOVsaZY1tDddok9hYvV2aC1aKG/M4C2WB24932Nw/eeZhqJ01UDRx53Y8QIHFb7etEMdANnlsgXvlwnGjTA9V0R9Y65+tC0e9U0i9K9B8xP795zEXCCHK5L17ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81cAw3WgnAy2it+flwapr8vUf7vKk/Ux2Gl0K9lN9L0=;
 b=Cqpc5CSW5diXGBA8zTdUD4GzsWv3poHR5mXTtE/z1worc8fTM+0yxU5EwPcGpWoaRvfOhV4LszpEaO3Pna/ekZEdmjHoKeM7tigRbhFNerj2eNkPx/xIm82o6KF5DKtpuEzDvH+TqDf6QLdVLKlwedc3HnCNLq2Kyn6FU9piyyw=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1091.EURPRD10.PROD.OUTLOOK.COM (10.169.155.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 15:17:12 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 15:17:12 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH] watchdog: da9062: add power management ops
Thread-Topic: [PATCH] watchdog: da9062: add power management ops
Thread-Index: AQHVphAFwdyccq+61U6+GK1Hr/H0vaemod1wgAAQYwCAAAQN0IAAH0kAgAADedCAAAY/gIAAEOMwgAAHs4CAAAK20A==
Date:   Mon, 2 Dec 2019 15:17:12 +0000
Message-ID: <AM5PR1001MB0994FF2BA214159D4D6F8BEF80430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
 <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <1feb2b8e-af46-ffa9-873a-fd9b624294b9@roeck-us.net>
 <AM5PR1001MB0994B8FDCC3C1B991433344780430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202150601.r3qb3b3kaezlihee@pengutronix.de>
In-Reply-To: <20191202150601.r3qb3b3kaezlihee@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3744554-172d-4a62-4f0e-08d7773ab4df
x-ms-traffictypediagnostic: AM5PR1001MB1091:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB109155AE55740BEDCD8DE9DFA7430@AM5PR1001MB1091.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(376002)(396003)(366004)(136003)(189003)(199004)(66946007)(7696005)(446003)(5660300002)(2906002)(186003)(6436002)(54906003)(229853002)(316002)(110136005)(76176011)(4326008)(74316002)(6506007)(102836004)(8936002)(81156014)(81166006)(6246003)(8676002)(53546011)(55236004)(7736002)(6116002)(3846002)(55016002)(76116006)(11346002)(305945005)(14444005)(64756008)(256004)(66556008)(66476007)(66446008)(26005)(99286004)(33656002)(66066001)(478600001)(71190400001)(71200400001)(25786009)(966005)(86362001)(14454004)(52536014)(9686003)(6306002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1091;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0gxtUrzZixCLLAkMFarpn5yFk+jhuqfSG0mZNjvW0MqwgWwcIl+sRcSzjBFd9/Pok4ng9SD2kk9l8/3MANOX0BLYGqQXYPXoVoV4/GzWiEtgZRoeg8idS0IBpXVa3hOFqtH+WrHe4ruXTMB1jbt7X2aRpzsS7Cq/KFqagTFZwS0X+UUwaherKZ9LWqMkWiatZ1Ka8HjYeG+oljvCWnD25sE+SEpCxe0taDaj7l//HRNp2vu1m0rVnFcgvg91QnePqBlZgHmvLYc1T7xIWCtV/inmqPFHMmTfnh87K18jqYmnkNb60nepuWm5J5PzDLwYOFarGTLv2X28aOyc5/2mvjfaNEFNl4emq3Uk5YquTeIfLWgKWINXZ30ulqQNpqiuMbmz7HT/+blF86WW0wn/U/XwYaHA7YyH5B2dtEEJXUjstdKuXZsXBMQvlx8mRvpAINWMro6JW0gAcwfE88mXaf5Nok5KP0Bo03QOSStSiNg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3744554-172d-4a62-4f0e-08d7773ab4df
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 15:17:12.1827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YHlpU/tNkA3oGeC/SPYSrziStf//Wk3sLuOqd9+lGSslVOxNqXSdytFuI1MgTmaVIPxA1gTOTBxzMSrEogTy9GuQagWTf6UGeQnxRYQXVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1091
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02 December 2019 15:06, Marco Felsch wrote:

> On 19-12-02 14:44, Adam Thomson wrote:
> > On 02 December 2019 13:38, Adam Thomson wrote:
> >
> > > On 12/2/19 5:27 AM, Adam Thomson wrote:
> > > > Hi Marco,
> > > >
> > > >>> Hmmm. Wouldn't that then be a board specific fix rather than this
> change?
> > > >>> Am concerned relying on software to reenable the watchdog on resu=
me
> > > could
> > > >> allow
> > > >>> for a hang scenario potentially if that code never gets to execut=
e. Other
> > > >>> systems shouldn't need this fix, assuming they don't have issues =
at the
> HW
> > > >>> level, so this this seems like it could be making those systems l=
ess robust.
> If
> > > >>> we are to do this at the driver level, maybe this should be an op=
tion
> through
> > > DT
> > > >>> to help faulty systems, but I'm thinking this shouldn't be defaul=
t
> behaviour.
> > > >>
> > > >> I don't think that we should rely on the OTP values. Those values =
are
> > > >> set by Dialog, the SoM manufacturers or by the customer itself and=
 the
> > > >> time shows that this is error prone too. At least if the customer =
or the
> > > >> SoM manufacturer don't ask the Dialog Support..
> > > >>
> > > >> You're right with the (re-)enabling but there are other drivers us=
ing
> > > >> such an approach.. IMHO it is safer to go this way rather than tru=
st
> > > >> the OTP and the PCB layout. I would rather add a dt-compatible to =
tell
> > > >> the driver to do nothing during suspend/resume e.g.:
> > > >>
> > > >>      - dlg,use-hw-pm
> > > >>
> > > >> or something. Because the user needs to validate the PCB and the O=
TP
> > > >> values.
> > > >
> > > > The thing is the DT FW is supposed to be fairly static so I would r=
ather not
> > > > enforce this change on users if they adopt a kernel version with th=
is update
> in.
> > > > I also still think it's safer if the HW does this for us. I would h=
ave hoped for
> > > > most designs this would be caught in early bring up where it can be=
 rectified
> > > > with minimal impact, although I'm guessing that's not the case in y=
our
> scenario.
> > > >
> > >
> > > dla,use-sw-pm ?
> > > dla,hw-pm-broken ?
> >
> > Yes, I'd probably opt for 'dlg,use-sw-pm' or maybe 'dlg,manual-pm' to c=
over it.
>=20
> Okay, so we are all agree with the dlg,use-sw-pm?

Yep, that's ok for me

>=20
> Regards,
>   Marco
>=20
> >
> > >
> > > Guenter
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
