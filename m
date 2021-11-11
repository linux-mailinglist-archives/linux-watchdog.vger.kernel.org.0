Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1F344D573
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Nov 2021 12:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhKKLDk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Nov 2021 06:03:40 -0500
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:12774
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229643AbhKKLDj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Nov 2021 06:03:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKRyGAYr2RqeQ/ZGKrxDFSaMpe5TpJllFWpm+YyTJwufrGSsqUBOvsZL2PU6F1feA0Pu+tKr0QvEv6ph14Ea9SkeOlHdhGf//Xd6P9rJYgx4YGnEVxVMtrUe4X/6KDzf2qDFrDVFWE3EGFnnJTlRA/jlpjCW8mb9QxiM79tfGwpcRkc4pAkN4na6WFoz1L/fXFXwOyaIh+C8j4OIy4Gaam+2aLIVX3J6c88S2JDSDZDSmhhouuF4HbBqnVEX6ouopVyPYbQTulljADfPwxjQXsABeVG0P9HllEVj4jLr/8sfuXavoYpqfJJv4vEYeBNy4uhm7qezvDy7sOBaw4nRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hua45vetQICUMrmnFaSkc63MTN8bdplwqV3XQgKlfI=;
 b=oDQKDr+D+j9TI9dUxLs0M/bUdB+KcfYZYlRVv6Zf/pCoADySwVVahj7pwNJwTNm1UPG2LIALWG1Xw4be9SD+q/Bxx1VbvcrKRShd6HGTeXmdh/UqzuhUWPf5aJq6mnFcp2P+ThJHEpsCIZbgRgU6FMcksndo6aZfP+OZ8io6j8mKoW7K7ZeDxmWClxginE3RV4sGqWyXEu8MpEG6MTo7wVzzVONm2Uu65QWpzDyCX8j4EaBrpdiPkvt8byQS1eTBWrkl3vsKgKMEXc3my3jlmgMaJ7F+jaqT7lHuCFB9u1CHKxKj5DjFwKuXVxvtalRJYCUpV/c5guz8003zmaO+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hua45vetQICUMrmnFaSkc63MTN8bdplwqV3XQgKlfI=;
 b=jY3Pvr6k78e9JEk0SUxRNzRsa3TrsaVRjx5MsaZscaRu2KH12aUAQsYKBzTt1fQL+PME7qLv2Ho9AVozqCTOdvKyKszdIiFTsSdhEV7h7+9DrpSOz8om6R6UmEzQQ7U5iniVinvDI9G0pkRMMohVg7fDDQGMuzWZf6ILBX1jmvQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2133.jpnprd01.prod.outlook.com (2603:1096:603:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 11 Nov
 2021 11:00:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 11:00:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX1tl7QLhEj0vVq0e6tkxn8lBWSKv+HhCAgAACUvCAAAXsgIAAAfqA
Date:   Thu, 11 Nov 2021 11:00:48 +0000
Message-ID: <OS0PR01MB59226D0ABF892D1D3D20D5E086949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111085225.7090-1-biju.das.jz@bp.renesas.com>
 <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
 <7fd9b931-32f1-73a7-7750-a4224cf89500@roeck-us.net>
 <OS0PR01MB5922B2C8928EC22AFF8BF23386949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <24319fb4-cc3a-1923-7238-db42ed93e51e@roeck-us.net>
In-Reply-To: <24319fb4-cc3a-1923-7238-db42ed93e51e@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e21587a4-6b83-44ea-cf1e-08d9a50284e2
x-ms-traffictypediagnostic: OSBPR01MB2133:
x-microsoft-antispam-prvs: <OSBPR01MB2133BA72F2362AB8401A872086949@OSBPR01MB2133.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zd2BbsCvSQgLMtRrFqOU0XphmIEre73caoXIHIBVIHFsCTtNdJtF8lfXP1D8jLta0v8lVW6qgBXsiSXZUMuCY1fDeP5c/WUYqVhpNQzfpGfbnH1r0TMEcduByrJTqckxWxI9HcXJ029i+pOc7qTpCh679MwvMRJOzNPvk1ZXdjB7shmgRhpquC+NQ57JA6bn5cqm7JRz6p7/HAm2tEaiLxRc+ZHChPtA9HuBHwWGJ5eHrxN+UyGbx0gi1Lh9LpaqUf3P7zhZEAjZUK/sBEKPLLX0ETeDocZ47HtLNMWaHMmPzvfsjtp02xE2UOOV0FuoGiYLXjWPbi1aUOZCK0amKjPL+4ufYsnWct9yuKhH7mYUlPXtcH93ZiravwYAX6Ym/dZxWKEjfDtVvJ4cY0kuiBpTL0Jce87Js3oZCCe1I2+NEZaCYaYLVNVkFXzLOPdgsHwGyeGkjOlBunOiCPFC+abYpUcIt+4RGwRsGpMeqs/5YUhRjE9eKCgjI3vzxz84EIiuDOjvqTJXo2mTqqPZ4rOuw5HEJHxdcVMWCDtWfJH+tcZL9x1OTC6+uWb/BlEtJxqQj1vL+x7lAdiV6z9ShCmEDEoEEVdPMDv8kWvmVbTqva3Z8oMkV3U4e3dSABxTPa9VbrozPMpBSpnzN3zhQ65y0s/8h8+lMTupAWI9U4Kg+9KWWfN2iTCaMe1/9SQ0hzC+DhRXKA5mFweqEuQ0Gg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(53546011)(66476007)(64756008)(71200400001)(26005)(66556008)(8936002)(66446008)(508600001)(122000001)(316002)(2906002)(110136005)(55016002)(54906003)(5660300002)(33656002)(9686003)(4326008)(7696005)(52536014)(4744005)(83380400001)(8676002)(186003)(76116006)(86362001)(6506007)(66946007)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DQa0GmmMEEn4kZW6mro2Nytp9lR3Rlh49nnNhBq2XZMfaDq3c1DnDew+Q4wF?=
 =?us-ascii?Q?B3ZHLjFxiSZ1jSGVwmW+4AX2z/8zD+3NQ5doMqv+JMO7cyS1U/2hxD1jvtZd?=
 =?us-ascii?Q?Fi0OuRqhSSoTR6faydb2qe6HOLTWXzs3Qtruj5GHe0kTUv3uWv6IQqwq6Io+?=
 =?us-ascii?Q?xyr9p+ZA70icUk7AP3IWMHdpAj9G1x+DvhioG0tM3/++MWaOjpII2gUC1EmO?=
 =?us-ascii?Q?ecY5QaMuQwqw+KKIyUQgF0BXFXdcDX7zjgRpls6ePl5pOsb/FxEXvauMvJ9X?=
 =?us-ascii?Q?/B8QnsHaLUE/q955A9e+CY3tMIl+bT3m3OjkWaA/Wi1jK1G6Iumq4nuw5kyE?=
 =?us-ascii?Q?0Kj2tmVRrNkaUjJxtClogBhAjuDzadbwQhhgZz9nR8GwBRhbmSm9qjWWKYQk?=
 =?us-ascii?Q?Hrs3U7yypoo+9trHr7wV1FrBPlslwqrHBtI5YtIBnd6KAdMHZW+CLAyrcszf?=
 =?us-ascii?Q?6bGrt4mnILNIq/JqkUoWXmTSgMw6e4emn261bwyvzj4D0I28JRbfhEPSJkVZ?=
 =?us-ascii?Q?60KLJQDEH3qH6SeiApUJzpVDCfNZS+q24gaCREXNRgusoIPwcIwKeTxrM7O/?=
 =?us-ascii?Q?WUTfSdx8LWHZiWONcGHq7lNcJurGhFXE507CojtTXSuqvmDRTOYGCKqyJaWA?=
 =?us-ascii?Q?Hhl/W6aiJwbbZuXAVGfQyDXVSX9OsLbKmL1LIv3TgNYzRHXzCtQQKU2iJZE7?=
 =?us-ascii?Q?YyOAR/SimTte+bKezZGjrYy8mtRl01Yvpl1rRMs1WaopOgh/wE8E2sXvH9V9?=
 =?us-ascii?Q?fi/Sc6jLMK0bmwJxbshIS2oQc8dPYQfeUVAlxWHPfydK96PRWOrDdxAI/cj2?=
 =?us-ascii?Q?mvvTIulz6pGeJO65WOumT4lBuYhIEglsTkOxhZNgzpC5SgyY/5P7v/ST6hhw?=
 =?us-ascii?Q?8U6lEFGf/ucsDvnd8YpZZ17f/7u+y63TOcrSbY4O5M0XM9eVXFCz+UtNLVGg?=
 =?us-ascii?Q?ddkCy+lRDVKaSmn+zJTySNVT+UNgFvhuuKR0Skc617Tx2+snYa2iga70K5JF?=
 =?us-ascii?Q?s39i0Z5fEX6s6B+lfj6pHTrymQtWQLw9G5BXWmYctICgbRsE0Z93vyirQbLU?=
 =?us-ascii?Q?hz3wCdJIGOazXhDIAh0iQCmuOrbjFnuzNlN/C/AWDXbNJIjWCBpHtrKh0z1F?=
 =?us-ascii?Q?7pP4IWRPlWRNGhsE9X8CIILCTxjLFyAgMchY42R99WjfV9EYisl/Im+aH538?=
 =?us-ascii?Q?y/qgVEUZmQUr2MZuU8czDYmGE6UrpbNHAx27Dmzvdj+JCf+ZYWryKR8luh1K?=
 =?us-ascii?Q?bCTouEKf/lbbNIpPdqwuG+TIAQDmjiu6CghUh+zvG0BBCGacRqWikfYoK1Sm?=
 =?us-ascii?Q?/h2DlylkWvtzdT27/qEXOgsCTO1aOIN3Q5lIMwLqXaY6PzkO3koEHMWPs97Q?=
 =?us-ascii?Q?FIav9iBaOI4NxTGwwXsazKXgiuYMck+hsfpyZH4NrPz5rH8cm3DcRozcHDw8?=
 =?us-ascii?Q?2AB3cT7lWfRyjj19j12S63vaSwWrxddslkUqKrbe+3VKP1FFJ7uZU0HIuaD5?=
 =?us-ascii?Q?u+Ijw47kKTZEO1iX40iba/msxclVRCIo5U+gZAmI7Sq8o2foaOhYCCTWbgFx?=
 =?us-ascii?Q?iS+QAkZc61RrV//Jak2G/1Jyei5im/DTps5EE6/3ZccuI40sVbIUtmxxXRn+?=
 =?us-ascii?Q?wWBFEknW3+Lnv8OmqVYy1sGfyNUSLGxvtH0WnvoprpcmoUBYTp0nW4c0sP2s?=
 =?us-ascii?Q?2gDtng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21587a4-6b83-44ea-cf1e-08d9a50284e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 11:00:48.6037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9uMFlhzBh9HI3748XhGUh6zh5jS39Qk/7ui1e5rcg3a8BkaUAhll+DMpg355RoWQoXeLFvCtK7FWzl59dTg73QhIB9mhRzWqnbMz2X6Ok0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2133
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> Subject: Re: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2=
L
>=20
> On 11/11/21 2:35 AM, Biju Das wrote:
> [ ... [
> >>> +
> >>> +	ret =3D devm_add_action_or_reset(&pdev->dev,
> >>> +				       rzg2l_wdt_reset_assert_pm_disable_put,
> >>> +				       &priv->wdev);
> >>> +	if (ret < 0)
> >>> +		goto out_reset;
> >>
> >> _or_reset implies that the action is taken on failure, so there is
> >> not need to do it again.
> >
> > As per [1], it can return -ENOMEM, in that case I don't get action
> > callback. On a safer side I will move this call after
> > watchdog_set_drvdata()
> >
>=20
> That points to devm_add_action(), not to devm_add_action_or_reset().

Ah got it. action will taken on failure.

Thanks,
Biju
