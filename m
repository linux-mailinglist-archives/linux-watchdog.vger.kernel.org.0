Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36833BB26
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Jun 2019 19:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfFJRke (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Jun 2019 13:40:34 -0400
Received: from mail-eopbgr700137.outbound.protection.outlook.com ([40.107.70.137]:1605
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726781AbfFJRke (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Jun 2019 13:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj1uFECfJDHl4P+EL66v5LSDyE1EngzM6NHQX1Kvycg=;
 b=PQRIH20ctWFhU25O4aNH/GMMf0i1rYVLIdDZDZGuMraj/2C6OpQ0Hx1CkWfjQqNqnODI9Wtm3fJW3Jpsvdbbronxz6Kh7j8R1994flZv7OPzgabo1By6yZTpG6mmsOpc1Kmjv3wsmHBF90buFIP4lnTuyO0XbWFE3l394f8xF7w=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5523.namprd07.prod.outlook.com (20.177.242.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 17:40:29 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 17:40:29 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
        "alexandre.belloni@free-electrons.com" 
        <alexandre.belloni@free-electrons.com>,
        "wim@iguana.be" <wim@iguana.be>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ken Sloat <KSloat@aampglobal.com>
Subject: RE: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Thread-Topic: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
Thread-Index: AdUfoOr5PB/8HxffRU28PtnqCbe4YAACJOOAAAJHDgA=
Date:   Mon, 10 Jun 2019 17:40:29 +0000
Message-ID: <BL0PR07MB4115CEC4D8CB4A9610E0EA78AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <BL0PR07MB41152EDB169FE9ED1AD3B4C9AD130@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190610162811.GA11270@roeck-us.net>
In-Reply-To: <20190610162811.GA11270@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c862fada-eca5-4257-b50d-08d6edcabb04
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5523;
x-ms-traffictypediagnostic: BL0PR07MB5523:
x-microsoft-antispam-prvs: <BL0PR07MB5523F3FB39E752F78FB80D2AAD130@BL0PR07MB5523.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(376002)(39840400004)(346002)(13464003)(189003)(199004)(66556008)(68736007)(14454004)(64756008)(53546011)(66476007)(486006)(476003)(7696005)(5660300002)(74316002)(2906002)(4326008)(14444005)(66446008)(256004)(71190400001)(6116002)(66946007)(186003)(55016002)(71200400001)(54906003)(6506007)(3846002)(52536014)(229853002)(9686003)(478600001)(86362001)(76176011)(81166006)(81156014)(8936002)(33656002)(7736002)(80792005)(73956011)(72206003)(8676002)(11346002)(26005)(305945005)(99286004)(76116006)(25786009)(6436002)(102836004)(6916009)(66066001)(316002)(107886003)(6246003)(53936002)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5523;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /jJVmP2t/m5S4mnwzTOR2ZQHpSbuLhyVU2KEu4EKGBz4nuAR1FEpqU6Y6PITgY8M4JJtSL9ookqf/WkWFCc8PPCwgN673zOzRyQfEYsFMAP5BuL1at00EAH/I3lFC8YNXNVQCwtiC75kJwR3tJoEFKtCvIKuKpY2elTRStd22mIKek2ZkM8l8Eeo9USKnxgF5k14eCN4bOLDT5YcnLgeLx99OWS7WDGzTJgRnNvy9rv9nI2chWi5R1Nq2wV/hhjB5J0hhURhHtvbZtTX9aPVErfUArPx/iZMlC3gNF3+SB4e9//mDB0YhmYqaq3XctdYL6SNm9MRcX6XRxpo2gO61mcKqoCMZNEncPOIpkxe98vw8q9R4lPP3yelw9IVIA5TaOCnjWAFsRmaONCXHUgjt44+ImX9SXFgSyN59v712hY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c862fada-eca5-4257-b50d-08d6edcabb04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 17:40:29.4829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5523
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
X-OrganizationHeadersPreserved: BL0PR07MB5523.namprd07.prod.outlook.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, June 10, 2019 12:28 PM
> To: Ken Sloat <KSloat@aampglobal.com>
> Cc: Nicolas.Ferre@microchip.com; alexandre.belloni@free-electrons.com;
> wim@iguana.be; linux-arm-kernel@lists.infradead.org; linux-
> watchdog@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [RFE]: watchdog: atmel: atmel-sama5d4-wdt
>=20
> [This is an EXTERNAL EMAIL]
> ________________________________
>=20
> On Mon, Jun 10, 2019 at 03:51:52PM +0000, Ken Sloat wrote:
> > Hello Nicolas,
> >
> > I wanted to open a discussion proposing new functionality to allow
> > disabling of the watchdog timer upon entering suspend in the SAMA5D2/4.
> >
> > Typical use case of a hardware watchdog timer in the kernel is a
> > userspace application opens the watchdog timer and periodically
> > "kicks" it. If the application hits a deadlock somewhere and is no
> > longer able to kick it, then the watchdog intervenes and often resets
> > the processor. Such is the case for the Atmel driver (which also
> > allows a watchdog interrupt to be asserted in lieu of a system reset). =
In
> most use cases, upon entering a low power/suspend state, the application
> will no longer be able to "kick" the watchdog. If the watchdog is not dis=
abled
> or kicked via another method, then it will reset the system. This is the =
current
> behavior of the Atmel driver as of today.
> >
> > The watchdog peripheral itself does have a "WDIDLEHLT" bit however,
> > and this is enabled via the "atmel,idle-halt" dt property. However,
> > this is not very useful, as it literally only makes the watchdog count
> > when the CPU is active. This results in non-deterministic triggering
> > of the WDT and means that if a critical application were to crash, it
> > may be quite a long time before the WDT would ever trigger. Below is a
> > similar statement made in the device-tree doc for this
> > peripheral:
> >
> > - atmel,idle-halt: present if you want to stop the watchdog when the CP=
U is
> >                  in idle state.
> >       CAUTION: This property should be used with care, it actually make=
s the
> >       watchdog not counting when the CPU is in idle state, therefore th=
e
> >       watchdog reset time depends on mean CPU usage and will not reset =
at
> all
> >       if the CPU stop working while it is in idle state, which is proba=
bly
> >       not what you want.
> >
> > It seems to me, that it would be logical and useful to introduce a new
> > property that would cause the Atmel WDT to disable on suspend and
> > re-enable on resume. It also appears that the WDT is re-initialized any=
ways
> upon resume, so the only piece missing here would really be a dt flag and=
 a
> call to disable.
> >
Hello Guenter,

> Wondering - why would this need a dt property ? That would be quite
> unusual. Is there a condition where one would _not_ want the watchdog to
> stop on suspend ?

Good point, not sure there would be.

> If anything I would suggest to drop atmel,idle-halt completely; it really=
 looks
> like it would make the watchdog unreliable.
>=20
I agree, while it is a function of the SAMA5, it seems to me that it is not=
 very=20
useful in Linux, unless I am missing something. I will wait for Nicolas to =
chime=20
in before I submit anything. I can certainly submit separate patches for ea=
ch,
I already have something working for this.

> Thanks,
> Guenter

Thanks,
Ken Sloat
