Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDF745EF25
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Nov 2021 14:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348819AbhKZNdr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 26 Nov 2021 08:33:47 -0500
Received: from mail-db8eur05on2051.outbound.protection.outlook.com ([40.107.20.51]:31573
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229709AbhKZNbp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 26 Nov 2021 08:31:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYz/aoXfGq015iY9h8fCZxTGjNg37KiQbeVCt3RRLQet31UVvQky8WQtA/6nPeVRilEHYncZ+KyLqcMxbTtMG2frR3Pa/LkrUIX9HmoQJlqWQfSbq4SqOx7WPBpVp/eK+G7E3CU4I+S7bZWnpfXpOaQ6jLohczfoOBpDFHtonXeqOvYpubCK5b0UyLc7i2QP7WfWV5XsJMqcmRObv7TmwJEUnJD+xd/UlqIzjqmiHP7IVtZ85GE+bINDh/4RTEzLIfk6oQ4G2OoyTnE0qg0HexQs4cY1NWBKMhK2AGSJgiJ+mdZ/jiK78pKmT3mEeRrmak098MByghXcI8pOVgKunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0OuaIGlFOy5Vxz8ttvooW859m7CIg0qdMGo8NmQmGY=;
 b=FHzEeSmrnMNcNR3J5b/HAy+U1qSXqDGw5INgkLs4Yll8yTAnhCmXUzJvAy1yXVZ2/bj9NsWvyrDMw2VEN8J3yxdl06ZxNbL0n55a6VJDxG5SGpJWLIvuNl1+NXDaHVigIl6mUQkqiRipkIkktPcvuBff2ch0AFIx/gP8tBRBZQ+5bD+uHWOJzYzRTnhZxNNpTdC7LNNa6mg+cbK5mO0Su7YDm0ymklkc3L2hQ1pTPcsAi7C0wsHUMmsve37JJBnePByXguJ7G8aqciY5UPd1huCv1HUSlojZ76It4oYDxlG/qRwCfh8T8VQZLgbLSirMnBLvVyfQ3Fsv2GxS8+RNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0OuaIGlFOy5Vxz8ttvooW859m7CIg0qdMGo8NmQmGY=;
 b=QYNpJFUpdrWbRoHG6o/8JUoexGcp7pjDMo/eTobSk2AAlfXZoIQ5fmZAmCvCP8t7IffeLSdPORpBgrhJu6PtxI3I6BA9RKc+9SZFBgmpVBQYOmHeDcM+RIqEp7qrG1nhnqVu5WUzC47E8sFjWcMFhn8ek1CYqCfsDi0tsbRk54Q=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB8PR10MB2812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 13:28:28 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4734.020; Fri, 26 Nov 2021
 13:28:28 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Andrej Picej <andrej.picej@norik.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     "y.bas@phytec.de" <y.bas@phytec.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] watchdog: da9062: reset board on watchdog timeout
Thread-Topic: [PATCH 2/2] watchdog: da9062: reset board on watchdog timeout
Thread-Index: AQHX4Q3npNRtviCugkid2y7uipNYX6wVzxog
Date:   Fri, 26 Nov 2021 13:28:28 +0000
Message-ID: <DB9PR10MB4652529FAC6253C266B172EF80639@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211124083258.2606511-1-andrej.picej@norik.com>
 <20211124083258.2606511-2-andrej.picej@norik.com>
In-Reply-To: <20211124083258.2606511-2-andrej.picej@norik.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49a61036-be5e-48e1-5cf9-08d9b0e0a210
x-ms-traffictypediagnostic: DB8PR10MB2812:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB8PR10MB2812DE7062D1E5918A0BC299A7639@DB8PR10MB2812.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uSs3cwtLPr2MZvpJnjgjz9QJdpjqU7aF6d/nN7iS/d+9t0WbGF4QxhaQYCC7UTlEIt0GUf5/AYQ/swMD8lq0rJXrhmdYIg04phfcoFlDUbWpSIdAgnVnL0tPP5/NHl8Jn/QsQKLPvy/3cRuC5ZCT/hpNvxMP6MQ1LOmAkFqVgNYvw7VMPMN9ACazaA9xkKluenrIprzXclSccblo3j4rdh5d6LHXx3RWGhbFJXRImGBV2FV4hBGKKPB5NKpW/+K/3vtfzE6GfBIDAftb6RCzZMLfcHAt3IvkoTvXsOszKxcwDGoan5lowWUY1qo0rTZSFpZdlaExEI5NkGJHX0dHJ8l36HFpiAtvwqbDLPRNydaQ6IkTaBkE8EHQM3oKxRqL72CNM5q7OzIHKaAjlpQCGp/qjnkGCMmzLQPln92qdOWz4GNvt5NYZkGLhNuRR3w9xlXSLoiiQVZa7YtoqR87ydLCTe/RBd05MykzaMenstEi2W1ZvE2tkfo3M37NwlFoDTbVdY3EbcbY6DstjhoLegsGEeloggUFVhF0WGrJJTk2WOcUW/1wKF/CnxVxYGXQOG10/e69/Tli5nhKeKiFb6svHfceKGVehkeodFCpQc8G/F7+4Kuz/mSZbimM2s4bfhG+vzCIKSGd0RE4LV2Bk1UN/bFoM/tK+Ccg6l08l+7yzXZdYPVYGLi922+ZxJeLqz8IfwzmeNwISQWzOwZAyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(38070700005)(33656002)(64756008)(66446008)(76116006)(66946007)(55016003)(122000001)(55236004)(6506007)(186003)(26005)(5660300002)(83380400001)(53546011)(110136005)(86362001)(508600001)(8936002)(2906002)(52536014)(38100700002)(54906003)(7696005)(316002)(4326008)(9686003)(71200400001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qkjzef8X/AnJlciCU/eLZ4rgpELIcJm+S7ZmAklbPGXNVFQqQxnUsb/j3TqP?=
 =?us-ascii?Q?fenVznhkADD/LvtkDX0YuOLpuUjU+9N7G2fMlaOMQaOYCkdshY2FRvXPObG6?=
 =?us-ascii?Q?71LOeBzpsort2AncWbuIovv8u7IWIH3PDf1r1Lzo9Sp+//wcNQ6vCp88eVac?=
 =?us-ascii?Q?t2Us5vAZtTzo2CscGCp2WH/SOOiPiIcPn4vC2AYT/wAe2TTZ0a589xjIrIiC?=
 =?us-ascii?Q?A0PldZE1yhGt6xOJyiSDDEgBVid9N+k8vmxyXv+lab2BAiWDIUzUz8nGSfmz?=
 =?us-ascii?Q?8XtreIWBfp1ky+akQEHmBpMqn5SefF/ChYETagEr7PFb+BfHKNa1VnDxYV0P?=
 =?us-ascii?Q?8B/SCSQAURH5uhtqBJlxnwljFcU06ppJvaPrL5VT84giwlbYo8cMcL6iy2O2?=
 =?us-ascii?Q?KPVC+e2oADcnUuy5saEX8LPa/O6qX+Ai1FHa8J8CwNuzx19g01gxBNBI421e?=
 =?us-ascii?Q?qHjGmgciizlt1DGMM4mdpJAXDbGW458l4FrYVxbHgg3ezyhTZsNK8KdxTenH?=
 =?us-ascii?Q?fzYVOUZCCsGfG+4RsMgiEDZonoiajSLsHK7hMGhaJplPr4X8VH5EgfaJZeBC?=
 =?us-ascii?Q?eOcDOcqkbhAAkY/VuAeATM+eVFxvyqlFUoQAYqs+eNcNNNtRUTxVOENWujlo?=
 =?us-ascii?Q?zyEOc7wSHLIRlr5alvkli16kdN+zVMUWBhQgZUWCLZY6NNKK5K6m4gdhMzI7?=
 =?us-ascii?Q?JIz7x5fidvAT4HN0u5sF0SDpNpq8Cn+43rsY69iN48dCjGF67176DyBSIy2q?=
 =?us-ascii?Q?wHYPqCDM/a24XIULyu/eHbtNpIKJF3G0WSdTnMSzWK1O2pyxYQH0M4MoaHqy?=
 =?us-ascii?Q?8Yj70YHEhxGsFpDcfdZUDJOu2pSvh4Kln3/OZJbFY4mewUNvVzQcO3wFNm++?=
 =?us-ascii?Q?LCQA6beWqwEZ/4R1+rqSCq4qpxDGYAYotXELQV38AXGB3zQFf3unQeKqrxJZ?=
 =?us-ascii?Q?G77//7ArgEzG0XTU6uDWz5oJDEhDqQIorqV1S27nx5ZJQ7R8W+mzmoeGW2/2?=
 =?us-ascii?Q?RVx8AcZs1rtyTUnacHSOOrfO6gzkJygjMubr1DlhtM8mEiRB29kZJDi9MFjd?=
 =?us-ascii?Q?mudDCFfjcjdYYRcaxv9IFpec1ZXKSgCQa2qDnQRxzuQ/XDB7D09R4U1fVwQs?=
 =?us-ascii?Q?gKkV3hBPFMlCTcFaNlTDpafTvwnl/wvXldl9t10MxXVqC9kw19eqvRCSl60d?=
 =?us-ascii?Q?eeiw9KbjzBTzmCHDwMwnIX9xk3cZ4/lZYCCFqn/nc51LHgE0Df7BJFy6EGW+?=
 =?us-ascii?Q?EDl1Ud+oYl7Z2p4lhayDFmAGfC0dAwnEb5434wFFqBcLjFp8CjfxpWjc2pNQ?=
 =?us-ascii?Q?hnmtMSUUz50N6O5Fn9TUchC+gsdtX0WXmSCbtqRiIP1JIKcStLq+kVXetDWM?=
 =?us-ascii?Q?3JxnaOTB9ZKtSFuySBKqqAR2nkzJXLlhaqKo1OPEO8mVBIOBcNBbWJJBPpqY?=
 =?us-ascii?Q?7RU2YYitXsVeuJ2qc2eWHkJolYKCQcr3bZSO79cZD6SaroC0Er1CWEJY7sC2?=
 =?us-ascii?Q?Z3VwgH4BdP5Q1TB+IGQ2H63y4R2IwuJwPegjJxoXNgdUDuBkUfwSKWQrkBLf?=
 =?us-ascii?Q?w8FF4Ea5SPJk57Qv3ZmROO03tJ5EXhW+q+gPttvzu/uNM9IcvhvIyhamGZnJ?=
 =?us-ascii?Q?hk78IjdY9XJue4P/E+4SfzqIXY+YhhiI37kg/cteDiyDiPSpJiYkjSjktQZC?=
 =?us-ascii?Q?ZaB/7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a61036-be5e-48e1-5cf9-08d9b0e0a210
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 13:28:28.5958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUwVTplv7PuHzvSMq/0LM9W10PRvgRtQ1drn1r2otB6S0pfrJadWTRcOu1pvvUYhtEqO+mLhrOJRnvfGWhCf0H0N0OHWNbXz3MbzDmh0/gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB2812
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 24 November 2021 08:33, Andrej Picej wrote:

> From: Stefan Christ <s.christ@phytec.de>
>
> In the default fuse configuration the watchdog poweroffs the system
> instead of resetting it on a watchdog timeout. This patch changes the
> behavior. Now the board is reseted and reboots.
>
> Note: This patch requires that the config register CONFIG_I is
> configured as writable in the da9062 multi function device.

I'm a little concerned about forcing this change in the driver. There may b=
e
platforms which don't want the PMIC to perform a full reset through OTP re-=
read
and if we hard code this change then that's impacting those platforms. If w=
e
want/need this then I think it should probably be a DT binding for da9061/2
which then indicates the behaviour we want.

NRES_MODE bit also plays a part here as it controls whether or not the nRES=
ET
line state is changed as part of the power-down/up process. I'm assuming fo=
r
your setup this bit is 0?

>
> Signed-off-by: Stefan Christ <s.christ@phytec.de>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  drivers/watchdog/da9062_wdt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index f02cbd530538..a04613e68f4a 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -87,6 +87,20 @@ static int da9062_wdt_start(struct watchdog_device *wd=
d)
>  	unsigned int selector;
>  	int ret;
>
> +	/*
> +	 * Use da9062's SHUTDOWN mode instead of POWERDOWN for
> watchdog reset.
> +	 * On timeout the PMIC should reset the system, not powering it
> +	 * off.
> +	 */
> +	ret =3D regmap_update_bits(wdt->hw->regmap,
> +				 DA9062AA_CONFIG_I,
> +				 DA9062AA_WATCHDOG_SD_MASK,
> +				 DA9062AA_WATCHDOG_SD_MASK);
> +	if (ret)
> +		dev_err(wdt->hw->dev,
> +			"failed to set wdt reset mode. Expect poweroff on
> watchdog reset: %d\n",
> +			ret);
> +
>  	selector =3D da9062_wdt_timeout_to_sel(wdt->wdtdev.timeout);
>  	ret =3D da9062_wdt_update_timeout_register(wdt, selector);
>  	if (ret)
> --
> 2.25.1
