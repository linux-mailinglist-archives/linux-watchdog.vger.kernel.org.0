Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B11AD46B38
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 22:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfFNUpd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 16:45:33 -0400
Received: from mail-eopbgr680128.outbound.protection.outlook.com ([40.107.68.128]:20294
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbfFNUpc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 16:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LJs3kHOWi3j4TbBy3wsNFShGNm1OeEJNgVtrMZGuOg=;
 b=tl9Tkb1OcbCVBQNcdpmRSMTqcifPl8P57kZOTOxcpNmQbetbrJOB6W2VbtuqEKXgP90axSP2dxYC/lG7zml9jBRPYTGDTi8qAQlLSJj6qmfaBPp5I3kHkJ+FYUnlrRAaGmdexentvv9mY0WsIDYzB+kIyAoutkCGEI0njVROrq8=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5521.namprd07.prod.outlook.com (20.177.242.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Fri, 14 Jun 2019 20:45:28 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1965.019; Fri, 14 Jun 2019
 20:45:28 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Topic: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Thread-Index: AQHVIrAmpSe7ef5LPkq+gtVGV8yaCKabW/WAgAAQIfCAAAbcAIAAAenAgAAmm4CAAADR8A==
Date:   Fri, 14 Jun 2019 20:45:28 +0000
Message-ID: <BL0PR07MB4115721DA2EB445BE7590BF6ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
 <20190614164609.GA29814@roeck-us.net>
 <BL0PR07MB4115E99D065FD9BEA4C43BB5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190614180826.GD3369@piout.net>
 <BL0PR07MB4115D5ECDEDCC028197637E5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190614203327.GE3369@piout.net>
In-Reply-To: <20190614203327.GE3369@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef799d38-ce9a-450a-4553-08d6f1093bfb
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5521;
x-ms-traffictypediagnostic: BL0PR07MB5521:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR07MB5521FD3294C937CFBF135680ADEE0@BL0PR07MB5521.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(376002)(346002)(39850400004)(189003)(51914003)(13464003)(199004)(8676002)(71200400001)(7736002)(68736007)(81166006)(15650500001)(74316002)(8936002)(81156014)(71190400001)(99286004)(80792005)(14444005)(52536014)(256004)(229853002)(316002)(5660300002)(66066001)(25786009)(4326008)(478600001)(2906002)(11346002)(6246003)(7696005)(476003)(186003)(102836004)(53936002)(6916009)(14454004)(6116002)(486006)(76176011)(446003)(66446008)(66556008)(6306002)(66476007)(6506007)(55016002)(86362001)(9686003)(53546011)(3846002)(966005)(54906003)(66946007)(76116006)(73956011)(305945005)(6436002)(26005)(33656002)(64756008)(72206003);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5521;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1n57G2uVzOQuQ4YESdudQgJYMrha4miz0Ca+ReHjOhlsazLzZFGPUUedvp78P+cF0zEZ0CPOJ1ziufUHKJCkwxq0Im26HSm1EWrUOZcidkfn1WJ7SWdqm9HYReNLSUqhxYmmOpm3iy1axTk14ZpHt9dZCP/t5uHx/zrCb+SlqP+VOKOJOARuYnNzGmcBbd5UeN48u5zFAg9xu9rwSArLBbNQKF2aP077oGG9mNqo18IIYqYnKbiaDQxSWxfwvx11iWqmmdX0hg+Gw0jKJ1sJHr34q/daU+RxsuaAvgUhwRTJ3xUQhRPvLK11H7mScULAfS8ce+dSYUAKqcGLwWSXFF2qXykCn5fLPuYuPzsPNw2XaoIjdj2kaZ+fXnwwnctj6JO6Wr6SWwDACXL8i2u40zPktcC0v+wTH15g2T5vn78=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef799d38-ce9a-450a-4553-08d6f1093bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 20:45:28.0817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5521
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
X-OrganizationHeadersPreserved: BL0PR07MB5521.namprd07.prod.outlook.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: Friday, June 14, 2019 4:33 PM
> To: Ken Sloat <KSloat@aampglobal.com>
> Cc: Guenter Roeck <linux@roeck-us.net>; nicolas.ferre@microchip.com;
> ludovic.desroches@microchip.com; wim@linux-watchdog.org; linux-arm-
> kernel@lists.infradead.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
> watchdog on system suspend
>=20
> [This is an EXTERNAL EMAIL]
> ________________________________
>=20
> On 14/06/2019 18:43:22+0000, Ken Sloat wrote:
> > Well I'm a little confused still because there are two separate
> > comments in these statements. The first within resume implies that the
> > init should be called because we might have lost register values for
> > some reason unexplained.
>=20
> The sama5d2 has a suspend mode where power to the core is completely
> cut. Only a few IPs remain powered (in the backup power domain).
> Unfortunately, the watchdog is not in that domain and may lose its regist=
ers.
>=20
> > Then within the init it says that the bootloader might have modified
> > the registers so we should check them and then update it or otherwise
> > disable it. I'm not trying to pick apart the logic or anything, I'm
> > just readily assuming it is good as it was already reviewed before.
> >
>=20
> The bootloaders may have started the watchdog (this makes sense if you
> really care about reliability) and so we need to be careful to keep the p=
roper
> parameters.

Thanks for the explanation Alexandre I appreciate it.

> > So without digging into that too much, if we don't know if any of the
> > runtime situations above might have occurred, then isn't it best to
> > leave my patch as is? Yes this has the side effect of resetting the
> > timer count, but if the init call is needed and we don't have any way
> > to know if any of the situations occurred, then we have no choice right=
?
> >
>=20
> Until we can differentiate between suspend modes, we have no other
> choice.

Ok I will leave my patch as is for now then

> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks,
Ken Sloat
