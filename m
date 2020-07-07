Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254E9216C96
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 14:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgGGMN4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Jul 2020 08:13:56 -0400
Received: from mail-co1nam11on2136.outbound.protection.outlook.com ([40.107.220.136]:27000
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728053AbgGGMNz (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Jul 2020 08:13:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FETKPUCAFjSTYUU+CmWQNcQXHOzXpl/5qVF8cY+/UN64obYpqF6McJpAJiP+fDrEjnpgR/C+K52KTqojoVgqfLSXxe++JTYHNxQodg0xdBQIjaNGkkp/9sFwwGBhyehEdocyoOkpEpRzJvwQ8j6AiOj5jFMNVDrRimYnIXk2KosObzuIyE6Jl0ozBZL15/yytt3UdSsYTJxoawp9YZtER/AtUj1WDpwVR4Y9Cl7WHtaJrp8VPIZoLsp12vQpvQsMU4w5aX5Yi5QIzl4p5hUOKKrRhK4xDYXfudmH+xidSe41Wd0vPGaNXl7UMfGHlhTpjuucQB0ziZP6SsdWe7lRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgIlzWnuWeGaNJhjWYMyGkGOidyQanpqiaj+Uu9O/b0=;
 b=i313B+qIxOLCVGXaNiOVd+RWdiUjbUjZeivNclL3wiYMnRwrDInxXtjTaRDRrpnwmMPLw6r2WHs1sLiNvLhNe4uCjpkk/y2Rg4UQGp0ET1lkss/Be1ddR8aQVOu3/n8zb/SLccP5wmQdo5f1DGxxpPzuez7p+ECY5Lf2KXg/AE+AbvraRlVf0e37E64WBBOQOarMK27QknElME0BGMoCFR7VGIjzGjBmZ3YIdSSZeIRdoXFqrK1FA9NSENOScn/a6H8iJMDOi72RGCjG+XYZWKQR9GQq0iFqIubdKJqTTemdnedyFMFihgR1OTx932f61G+V1wEgu3qI8ouvu7W0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=adtran.com; dmarc=pass action=none header.from=adtran.com;
 dkim=pass header.d=adtran.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ADTRAN.onmicrosoft.com; s=selector2-ADTRAN-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgIlzWnuWeGaNJhjWYMyGkGOidyQanpqiaj+Uu9O/b0=;
 b=XBt2eL0O+yVPEGsLZ3npkeqzW7j02EReZV0i9KSTGWb3QHfgSw+gnnJaby9Jde7evlvX9AiGoqPy4hsmV6BiJeZFNDVp+hKk+Rx3QdcXLRRrcE1o92wgjmrnYMUNuTP/bUu57yxFH5m8Y9cWG+JOE59TxjFNLXHmU364pRWJFTk=
Received: from CH2PR19MB3590.namprd19.prod.outlook.com (2603:10b6:610:41::21)
 by CH2PR19MB4056.namprd19.prod.outlook.com (2603:10b6:610:a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 7 Jul
 2020 12:13:52 +0000
Received: from CH2PR19MB3590.namprd19.prod.outlook.com
 ([fe80::d08:8df0:e25a:2a83]) by CH2PR19MB3590.namprd19.prod.outlook.com
 ([fe80::d08:8df0:e25a:2a83%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 12:13:52 +0000
From:   Timothy Myers <timothy.myers@adtran.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
Subject: Re: [PATCH v3 1/1] watchdog: Add common nowayout parameter to
 booke_wdt driver
Thread-Topic: [PATCH v3 1/1] watchdog: Add common nowayout parameter to
 booke_wdt driver
Thread-Index: AQHWU7JDRSh3gBbtWE2YCV42YoqLz6j7H2KAgADogn0=
Date:   Tue, 7 Jul 2020 12:13:52 +0000
Message-ID: <CH2PR19MB359083E23E8A94C23EE712379D660@CH2PR19MB3590.namprd19.prod.outlook.com>
References: <CH2PR19MB359059AA5C8917D8D24633FF9D690@CH2PR19MB3590.namprd19.prod.outlook.com>,<ed8ba33f-b3d4-8070-e0ca-fdaf4668cf91@roeck-us.net>
In-Reply-To: <ed8ba33f-b3d4-8070-e0ca-fdaf4668cf91@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=adtran.com;
x-originating-ip: [24.96.75.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32f1834b-f094-445c-1fc6-08d8226f365f
x-ms-traffictypediagnostic: CH2PR19MB4056:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR19MB4056E94E6BBC72A0A53ED0589D660@CH2PR19MB4056.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 057+PLjLkPT6DmWrmd4mH4vkAWer7PHxkR5VnpTW6DWIAfXw6BjAWOehWiXs48EPSpziyB9T24LuHt/q5lEPOhdAWwZm3i036YloQhk5e/QjTGXffl9xVTst4+fpwLFKD0B8jGwOqLvwOJ3a4ekz3fdYSVw8+a+jD0osP9r2Lp97JLvWMXusIp76x88XmnuSd1rB/7n7nlZb9hRmkB413fzD9ZYdwtWa33MQwsnS753dRHTzAg5+P1wiCZHeEZv4wM5hAOoKoYAvRl+Cj5Ha+hqu5i5BiuqTa/GXgY05Mo/rXbGE6bKjKwHfWPf0i+O0pwiEi16O0bXUzzhFcsYtPza79iFmjubuY/3a+KhF68QRrxhzNzL86MlZTQovACkuXcQvkVelPWY1cPkqZvIedw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB3590.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(396003)(366004)(376002)(136003)(8676002)(7696005)(9686003)(966005)(4326008)(5660300002)(478600001)(71200400001)(44832011)(83380400001)(45080400002)(186003)(52536014)(53546011)(55016002)(26005)(6506007)(2906002)(8936002)(54906003)(107886003)(91956017)(86362001)(76116006)(66556008)(316002)(66446008)(66476007)(64756008)(33656002)(66946007)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6gxBZNcOj/ANbfXOfUI392KmgRfJ3aQWmVZelz1zhMwUDafftQZDfMYkOmx4XAe1hI5oV0M63u4WU11w7D7H1XlgsfyWoxWrN+v1tkTUU3lQTvd38KsBIp6sQQ/2iWb68qE1zEBdaVS9z/qxrNdPuwEUxx44bja6PnYjKmMXvl52hhrVFtKQYRQ45758LHmEcPQO5i2pCsnWCiX2vjh385tMCL2pTDNGJGsfLrUt0AZcA5ClnGoUKo+BOGhj6ULcckJ9ukPvsTrmYO4k2NmQFfSneHEcwcMc38veErjbOvgQfgTJOBtr3rBv0w2P1iZpc4Ae9oaF/HNcQEB+vf0s73Tvt1mMGx7D1y6Nax97ao7h6ftG6GEhPVfWXWoStZnlmgnaIS9C69+ptSaRohojj15HLCTbSXdsgkXfPEw8sVwPp8WMqK6p2YAUXwKqi5rxM/bS1CTHTx06XBJOz6gbnCQtA5NZ6WxvbWWt1+t2qUU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: adtran.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR19MB3590.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f1834b-f094-445c-1fc6-08d8226f365f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 12:13:52.0613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 423946e4-28c0-4deb-904c-a4a4b174fb3f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1mt+cI3Kca91mrdIvbgyhF8gJD7fTxkCcjrHNft/tjhXS6A/GPNeRplIJIaD65M8eBZeg+XB8O3MlCNrccFguPsqi82YXqMB5sdbSKe4VYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4056
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

=0A=
=0A=
=0A=
From: linux-watchdog-owner@vger.kernel.org <linux-watchdog-owner@vger.kerne=
l.org> on behalf of Guenter Roeck <linux@roeck-us.net>=0A=
Sent: Monday, July 6, 2020 5:18 PM=0A=
To: Timothy Myers <timothy.myers@adtran.com>; Wim Van Sebroeck <wim@linux-w=
atchdog.org>; linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.or=
g>=0A=
Cc: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; David Boik=
e <david.boike@adtran.com>=0A=
Subject: Re: [PATCH v3 1/1] watchdog: Add common nowayout parameter to book=
e_wdt driver =0A=
=A0=0A=
On 7/6/20 9:33 AM, Timothy Myers wrote:=0A=
>> Add the common "nowayout" parameter to booke_wdt to make this behavior=
=0A=
>> selectable at runtime and to make the implementation more consistent wit=
h=0A=
>> many other watchdog drivers.=0A=
>> =0A=
>> Signed-off-by: Timothy Myers <timothy.myers@adtran.com>=0A=
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>=0A=
>> =0A=
>> Changes in:=0A=
>> v2:=0A=
>> Added Guenter Roeck's reviewed-by tag at his request=0A=
>> v3:=0A=
>> Fix whitespace formatting in message.=0A=
>> ---=0A=
>=0A=
>Change log goes here.=0A=
>=0A=
>I applied your patch to watchdog-next, but there is still something=0A=
>in it which prevents it from showing up at=0A=
>https://patchwork.kernel.org/project/linux-watchdog/list/, even though=0A=
>I do see it at https://lore.kernel.org/linux-watchdog/.=0A=
>=0A=
>Looking into the e-mail source, I think the problem may be due=0A=
>to some Outlook specific formatting in the raw message:=0A=
>=0A=
>Add the common "nowayout" parameter to booke_wdt to make this behavior=3D0=
A=3D=0A=
>selectable at runtime and to make the implementation more consistent with=
=3D=0A=
>=3D0A=3D=0A=
>many other watchdog drivers.=3D0A=3D=0A=
>=3D0A=3D=0A=
>=0A=
>and so on. If that is persistent, it may make sense to fix it, or=0A=
>you might wonder why some of your patches are being ignored.=0A=
>=0A=
>Thanks,=0A=
>Guenter=0A=
Thank you for applying the patch, and thank you again for your help with my=
 mail. I'll look into the formatting.=
