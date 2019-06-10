Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7063BDD8
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2019 22:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389703AbfFJUwj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jun 2019 16:52:39 -0400
Received: from mail-eopbgr800097.outbound.protection.outlook.com ([40.107.80.97]:62177
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389362AbfFJUwj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jun 2019 16:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHHjKf6kuve4zZKO2RaUkh6/E14EwdUI1UTEoLj5Rs8=;
 b=uQ856U5Plqo8Ml5tA784FOMTvh5Kx/bcsa4vh4L6pXg0tHePIbLxVTVOzykaQb/PBgPHQ7TWYmuPFeg7S1w1gAg33djS1CQALxVgzNK/R3hC2ElyYH3mi6NHxLHCz0Nyk8ciBUhbmlzZ3F5xvhbRI9z9e0caROKyENksnK2YALU=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB4082.namprd07.prod.outlook.com (52.132.10.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 20:52:33 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 20:52:33 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
CC:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "wim@iguana.be" <wim@iguana.be>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ken Sloat <KSloat@aampglobal.com>
Subject: RE: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Thread-Topic: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Thread-Index: AdUfoOr5PB/8HxffRU28PtnqCbe4YAACJOOAAAfaK4AAAJMTAAAAjEEQ
Date:   Mon, 10 Jun 2019 20:52:33 +0000
Message-ID: <BL0PR07MB41151D49B58CDF5E4A34D5A8AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190610162811.GA11270@roeck-us.net> <20190610201301.GH25472@piout.net>
 <20190610202928.GB13191@roeck-us.net>
In-Reply-To: <20190610202928.GB13191@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15b3f4a5-7171-4754-3b69-08d6ede58ff1
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB4082;
x-ms-traffictypediagnostic: BL0PR07MB4082:
x-microsoft-antispam-prvs: <BL0PR07MB40828AEBC6764A830720DCB4AD130@BL0PR07MB4082.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39850400004)(376002)(136003)(366004)(346002)(189003)(13464003)(199004)(6436002)(7696005)(99286004)(9686003)(68736007)(55016002)(66066001)(229853002)(5660300002)(14454004)(8676002)(72206003)(7736002)(305945005)(2906002)(71200400001)(81156014)(316002)(81166006)(8936002)(71190400001)(6116002)(3846002)(66946007)(478600001)(54906003)(25786009)(446003)(476003)(110136005)(186003)(11346002)(80792005)(486006)(73956011)(86362001)(64756008)(66446008)(107886003)(53936002)(66556008)(66476007)(6246003)(14444005)(76116006)(256004)(33656002)(74316002)(4326008)(6506007)(76176011)(53546011)(26005)(52536014)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB4082;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l7F8jaeIMOqhl1eszf4gtmU3fVCUGOLZsdNffOjw9oksNGYBRZCyGDrtu9oDwgjQAoaF2NL4q79wnOvRARNPH38wchCInVXCC6pyLgzZlU+8Bb4fSTgL+FcoFvHteWmGhgSrqBA5Mr9veOfcdlNAyvscpM+F8TU86BLRmCIW504u1zgEfk6jcvJDQ2V84UijwL864VvqVGGmVzjDqzjXm81U0fe+Jqpt0i3Ij3IaDDFz0RuS4xLDWcdEfWA0T7g6BWrhVB4GSEqUnllfyrPpXDJGmDqpH7Z3BH2QQ8w3GYIYhhdFOxJ8P6df9XcA8TlXs5oO3UESDaiJlvdSvn9cwRsvH8iigKtW9lFFRTtJaeMf60WHE2bxkvlYy/bonc2f/gko0qchFWkA5GsQRBDLT2f3xx7IPNzqgcSidIKqMp8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b3f4a5-7171-4754-3b69-08d6ede58ff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 20:52:33.6589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB4082
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: BL0PR07MB4115.namprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-TransportTrafficSubType: 
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 100.3.71.115
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-transporttrafficsubtype: 
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: BL0PR07MB4082.namprd07.prod.outlook.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, June 10, 2019 4:29 PM
> To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Cc: Ken Sloat <KSloat@aampglobal.com>; Nicolas.Ferre@microchip.com;
> wim@iguana.be; linux-arm-kernel@lists.infradead.org; linux-
> watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
>=20
> [This is an EXTERNAL EMAIL]
> ________________________________
>=20
> On Mon, Jun 10, 2019 at 10:13:01PM +0200, Alexandre Belloni wrote:
> > Hello,
> >
> > On 10/06/2019 09:28:11-0700, Guenter Roeck wrote:
> > > On Mon, Jun 10, 2019 at 03:51:52PM +0000, Ken Sloat wrote:
> > > > Hello Nicolas,
> > > >
> > > > I wanted to open a discussion proposing new functionality to allow
> > > > disabling of the watchdog timer upon entering suspend in the
> SAMA5D2/4.
> > > >
> > > > Typical use case of a hardware watchdog timer in the kernel is a
> > > > userspace application opens the watchdog timer and periodically
> > > > "kicks" it. If the application hits a deadlock somewhere and is no
> > > > longer able to kick it, then the watchdog intervenes and often
> > > > resets the processor. Such is the case for the Atmel driver (which
> > > > also allows a watchdog interrupt to be asserted in lieu of a system
> reset). In most use cases, upon entering a low power/suspend state, the
> application will no longer be able to "kick" the watchdog. If the watchdo=
g is
> not disabled or kicked via another method, then it will reset the system.=
 This
> is the current behavior of the Atmel driver as of today.
> > > >
> > > > The watchdog peripheral itself does have a "WDIDLEHLT" bit
> > > > however, and this is enabled via the "atmel,idle-halt" dt
> > > > property. However, this is not very useful, as it literally only
> > > > makes the watchdog count when the CPU is active. This results in
> > > > non-deterministic triggering of the WDT and means that if a
> > > > critical application were to crash, it may be quite a long time
> > > > before the WDT would ever trigger. Below is a similar statement
> > > > made in the device-tree doc for this
> > > > peripheral:
> > > >
> > > > - atmel,idle-halt: present if you want to stop the watchdog when th=
e
> CPU is
> > > >              in idle state.
> > > >   CAUTION: This property should be used with care, it actually make=
s
> the
> > > >   watchdog not counting when the CPU is in idle state, therefore th=
e
> > > >   watchdog reset time depends on mean CPU usage and will not reset =
at
> all
> > > >   if the CPU stop working while it is in idle state, which is proba=
bly
> > > >   not what you want.
> > > >
> > > > It seems to me, that it would be logical and useful to introduce a
> > > > new property that would cause the Atmel WDT to disable on suspend
> > > > and re-enable on resume. It also appears that the WDT is re-initial=
ized
> anyways upon resume, so the only piece missing here would really be a dt
> flag and a call to disable.
> > > >
> > > Wondering - why would this need a dt property ? That would be quite
> > > unusual. Is there a condition where one would _not_ want the watchdog
> to stop on suspend ?
> > >
> >
> > There are customers that protects suspend/resume using the watchdog.
> > They wake up their platform every 15s to ping the watchdog.
> >
>=20
> Interesting use case.
>=20
> > Also, I don't see why the application deciding to go to suspend
> > wouldn't be able to disable the watchdog before do so if this is the wa=
nted
> policy.
> >
>=20
> Many watchdog drivers already implement suspend/resume support. Such a
> platform specific functionality seems to be quite undesirable to me.
>=20
> Besides (and pretty much all watchdog drivers implementing
> suspend/resume do that wrong), you'd likely want to disable the watchog
> late during suspend and early during resume to reduce the risk of a hang.=
 I
> don't think you can do that from userspace.
>=20

Agreed, there's also the risk if using something like wake_count where the=
=20
suspend process can be interrupted by the kernel. This just makes for more
cases that the application has to try and handle, and what happens if the=20
application hangs/crashes some time between disabling the wdt and suspend?

Right now, what probably is a very common case of devices that enter low po=
wer=20
mode for longer than 16 seconds are precluded from using this WDT.

> Thanks,
> Guenter

Thanks,
Ken
