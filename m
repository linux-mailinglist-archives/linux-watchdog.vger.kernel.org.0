Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95495484608
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jan 2022 17:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbiADQgW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jan 2022 11:36:22 -0500
Received: from mail-os0jpn01on2131.outbound.protection.outlook.com ([40.107.113.131]:26559
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235378AbiADQgV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jan 2022 11:36:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUzsh7FL60mI9JqQ1Yq+zgzbBd4Shu+W7iXdrnS51FhLiuosrK0JRtXABCL8yhDU5MHTLTxESV8/0L9V1xL//cyJmFSQk6URLVeJIwN2ahioxTQEznFCBc058MHk4LtHDBnLqJAsLNMMpMHCBnaL/tWzS/WEjFAL3xhULJ/OsUexezSj4k3dNkFgR08vc0Mfi/AtIj9rdWqvOcjufahxuDX1U5OPh65uc/EmYNIk9U5OJXnvtIIOdyuq6tsGM/i9gu73pWbBGrvq7+pwwTurvaJX3JC2rN/MSHQngfqnkO8KFqVXIxHC/7kPBqjW9cXsI1XKXKxiZ+uO5VrOySO18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzZue/f8+v3IqKirwXa+vgsTvrYFj1YNtbh+O0jFwb8=;
 b=SUg8TA3LpQGDqnMGnbCI0DLRe3Pl+A0hLy7tlypCUB8Jg+vxG4c9nHeCJLiIrpUuxWbNrEUtDYH2FHZye4CH4zH9IOOjgn+5pW4zlRXj61Rr02mBT202fWLTF7cG1lAJWxAaRHMEb8BBzv2XQ95A4LpJZcXeWAFniUb85cf1Sij6zUwvGaf8dox7R2jyH1G2iY2J/Q3N0CQBkijhilWZgqKCQ3thJoaru6C4ystqPwaQMFkuPpBoElSLfBqvy0UNVkC/VHVpvgYsoKA1U9elf/MUni/PCHD8DBwobUFhwmSOahaoDFdr8LzY+DOeDpctWXp03xmt/EKlG2RZBuqLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzZue/f8+v3IqKirwXa+vgsTvrYFj1YNtbh+O0jFwb8=;
 b=N6Br2OiE0NkNwH66FZBH6GVYDpBYB8H8gDDNgEsoGva+dBlgN4lQ/M22YCNYnJYhxRvQrQLia6ci+gHtjY2E7jIFf0J8qWQoP+OmB1B+2Q4N8VRVtx1Nvc/tzXj1gxoD76LtOtxSyElFNvWcVFgOO3PTn584LPtZdY76GxSqpy0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3080.jpnprd01.prod.outlook.com (2603:1096:604:1d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 16:36:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4867.007; Tue, 4 Jan 2022
 16:36:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Topic: [PATCH v2 2/4] watchdog: rzg2l_wdt: Add error check for
 reset_control_{deassert/reset}
Thread-Index: AQHX8DXk1K2FoktqB0St/XMOQZtZVqxTMZsg
Date:   Tue, 4 Jan 2022 16:36:19 +0000
Message-ID: <OS0PR01MB5922C9C82A4DF486182F11CB864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
 <20211213152658.26225-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211213152658.26225-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b84de43d-1b16-4703-7891-08d9cfa05607
x-ms-traffictypediagnostic: OSBPR01MB3080:EE_
x-microsoft-antispam-prvs: <OSBPR01MB30807B77A905D2EA6310D77B864A9@OSBPR01MB3080.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8o/dw6ZjsxVQx2fzOyzogYYKueTtx2UL42fOKZ1zsnLsDn/xjAtb6prOcWTLlMsb/XQFJ6o+QwVC9XNg7LeDnNvZk4rIDHOLZnd6cIjgSkfygstrNSkhvi5T5PHq0yYQHQkhQj+P+dIUB23Lv11Znwd6FqA7hf4MMrJQcfqT9C5WUsDaVNPieJdre4PKMHm/UTfLWrX1ZsUWcMSTyFRzGlox+OH1fTL9l7syLd3+V1ryRQe8gIqM6l5S1suNrg/XNFs4vqjo/CWgUzrpCH+WsY0mGET1ewoBXyqtE3jiNpDBw4hW9syO62p6JOy5XUvGxvqM9OkN8nzyCXyEwdLFp/9q7Z8FvrmL4ZAmD5QdwTKWHMH1DNHY76KB/kMKJsBdZszmgkCjHB9xU4+3luCmDva1P09MbR8Et8A/5ZLs4NMT2mZUos06cAXw/xNRwiIGJN4d1LIkbCasSiaqwrLcFgtgejIqgy4xkBi5CUo9ZoGiWtyg3VNHa288y9BghOTJai824bwX0Ii0nmIzReZBpHkkjYkLQjnaJmC1/ppHfz4wHtHiD3bW/b2UOGBVMW5qidXWbEB1VZbsu/EiSmAV6Gu6t0NY92b/jPTQYSbzsRqD9IEEKIgWIo52+sJNhXTBkHArp9cFDaRkcfYprdOiTr8AQXJOX8aGlhh9qQQYbvdLBWmYkVz+60LsElkQKKcq8qLF4yuHyz8g0PUFQqGdzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66946007)(66476007)(83380400001)(2906002)(8676002)(6506007)(8936002)(316002)(110136005)(64756008)(38100700002)(66556008)(186003)(76116006)(54906003)(86362001)(26005)(7696005)(71200400001)(5660300002)(33656002)(52536014)(4326008)(122000001)(55016003)(508600001)(38070700005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MgluoeGhTkn9aydVdCco7bKrAo5MFLY92JDCnTqs2so9+2qvRr6kHHKECEO1?=
 =?us-ascii?Q?VecQeZ8aKnMNL5cAz6qqOvMA7gGqncn9slT2nHGAE9DxrPDeqvslcpac2R2S?=
 =?us-ascii?Q?YjlfCIbImaUkUj+vSVYCh13xMVs4yYkazkpan2+9epv33pM1jJsAyrYIhAiG?=
 =?us-ascii?Q?CG/OqNgMmrxMittccyTT5n5AM9O4He3XZTDoqwuSh/wxObIWzGDMNrP/XVJv?=
 =?us-ascii?Q?VK6OLmv2/yaZK2wF0NH6jQlleJKHekHACOU25LgB0Opw/2B0zoHYAt0mcmQ6?=
 =?us-ascii?Q?DBTKJnYggTdsUUrnOeuPpxs/0mTcG81BSRyBj7LYIQ/r7OsSU9G4RKrUC3J+?=
 =?us-ascii?Q?SduF34+nAXDOvSl0YBIfkjKlWP5fYnNs8Jwk4q+aHZIwOTsnN9viHfJMdi+C?=
 =?us-ascii?Q?xiu+mZ+h2oZPJUNVEaeKW+rZ3swwtKThI9rYUqow29ylKoUTaIC+eenOVDOg?=
 =?us-ascii?Q?Ii6cq7s2gTa++mRpDowUX8Kj7pOQ3NhY9OXKHWHkHDxFy6cSRttQmIqbTaot?=
 =?us-ascii?Q?hvNs2SGhiDMftyHhP6N6Vf5I7gKlW1Y9enBCC7s98I0nso3UwQ5mouWVrvcW?=
 =?us-ascii?Q?i9w7Fr5I7Y9ulRGbd7YIVv3FH6LoAHpDcfgeooN9wexnMUnzsKXbwLKqRADB?=
 =?us-ascii?Q?x5kVZZVLKib0BqGY0plcY3Dvb78z2dlAmLrueREsDvCFh3esQmlkrH4vOQ+4?=
 =?us-ascii?Q?x4bt4kPFzt+YZsFWyQF/5q0RMItYAGK9j5nNVjsP1lxE41BVE+1p8Gq9BufC?=
 =?us-ascii?Q?VUoxVP/P2PTqscgL8zTxZ9ku8iTVC0OM7kcTTvVOlNbaCZeMcDC0lpGn0eGQ?=
 =?us-ascii?Q?0eJbzD2Fm5RbCddmPK+/fVaPj679Cu4EVwQY6/x8PLLqtK+ECXrlc4XIRBEs?=
 =?us-ascii?Q?yT5Fb373Z1TKZSkHj38SHLiW3gPKyQ7klpAUvaqUCExclPvsa4PdjcXOkGhg?=
 =?us-ascii?Q?isEmpsEkF7kGqbV/jMJYUQ0cQw3NA6A0y9auUmcCUjlS4LXXpWH5Ic7ACLN9?=
 =?us-ascii?Q?ZsLnxWtoqyDBZMAW0dHFJ9vGBQz4D4jX1nLQezcIkhk6qOudSIL4GZSi1uca?=
 =?us-ascii?Q?VF8ZcYDQKoz0E5jwPbj/jjHkVWXKiEox3q8z3aHUz60S38oqa2BOUjVotF3X?=
 =?us-ascii?Q?gR4B+Uw5ktwhXkpeeVqIUVo+2k2PdS4ws1z45N6cCIGgxkT+2F/erEwha/LR?=
 =?us-ascii?Q?X0osQT42hV3r/JXe/Gyz2MlLkfF4wumAmhQr0djpPGH8Xm4Oy17uzzB7j3um?=
 =?us-ascii?Q?JtglinAsxxI32O+5pH40682WFyUOSfkIuOg8oyLK0DxLXEWcK8ECAT02EOEl?=
 =?us-ascii?Q?89fsM0mlv5DFtHANhtsA/vPMn/YYTTv5efGgEP3HJGZFkjrZiyW//eA97uP+?=
 =?us-ascii?Q?beFMVx9ZiGPWhpwMNTT/pM9TcKD9rxdnfanIRuc0v8wVXR6YCYPZJm4rhdJk?=
 =?us-ascii?Q?uyjsDfGL3LSxQjyebpwM/+QruJhV3r/CYuAW+wLFu1NtpMCXaOQ00NSdXSCR?=
 =?us-ascii?Q?ywlmJnonf3lrSvtSVsiX6ps9D+HtpsVtAJyQLbE+E8ypLWc60UrsjVBsNEPc?=
 =?us-ascii?Q?WLYcXgJV6P1M545/FdaQtPMbRO8C1vKeosdJ+BZrdRwETrOhv4ZGhOPykNCv?=
 =?us-ascii?Q?Wz5bYwzWYvD6Eaxv60TB34XqcbKLcIh8Kb0YHCYBfpcVAmum5njkwBM2sbrg?=
 =?us-ascii?Q?jmgBpw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84de43d-1b16-4703-7891-08d9cfa05607
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 16:36:19.2796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPW1+NpMsM4p4ZcR7HAvTwxgbhSBHh9y1vVtB6i1/BMtX6mVJhIZA+9kZFzmrzE0CzUQygRDM4ibrrE4wR+kY0VxBt3UsJc+prvRnUbftPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3080
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch? Please let me know.

Regards,
Biju

> Subject: [PATCH v2 2/4] watchdog: rzg2l_wdt: Add error check for
> reset_control_{deassert/reset}
>=20
> If reset_control_deassert() fails, then we won't be able to access the
> device registers. Therefore check the return code of
> reset_control_deassert() and bail out in case of error.
>=20
> While at it remove the unnecessary pm_runtime_resume_and_get() from
> probe(), as it turns on the clocks.
>=20
> Replace reset_control_assert()->reset_control_reset() in rzg2l_wdt
> _stop() and remove the unnecessary reset_control_deassert() from
> rzg2l_wdt_start(). Also add error check for reset_control_reset()
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit description and removed Rb tag from Guenter,
>    since there is code change
>  * Replaced reset_control_assert with reset_control_reset in stop
>    and removed reset_control_deassert() from start.
>  *
> ---
>  drivers/watchdog/rzg2l_wdt.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 96f2a018ab62..0e62d7be153c 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -86,7 +86,6 @@ static int rzg2l_wdt_start(struct watchdog_device *wdev=
)
> {
>  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
>=20
> -	reset_control_deassert(priv->rstc);
>  	pm_runtime_get_sync(wdev->parent);
>=20
>  	/* Initialize time out */
> @@ -106,18 +105,24 @@ static int rzg2l_wdt_stop(struct watchdog_device
> *wdev)
>  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
>=20
>  	pm_runtime_put(wdev->parent);
> -	reset_control_assert(priv->rstc);
>=20
> -	return 0;
> +	/* Reset the module for stopping watchdog */
> +	return reset_control_reset(priv->rstc);
>  }
>=20
>  static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>  			     unsigned long action, void *data)  {
>  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> +	int ret;
>=20
>  	/* Reset the module before we modify any register */
> -	reset_control_reset(priv->rstc);
> +	ret =3D reset_control_reset(priv->rstc);
> +	if (ret) {
> +		dev_err(wdev->parent, "failed to reset");
> +		return ret;
> +	}
> +
>  	pm_runtime_get_sync(wdev->parent);
>=20
>  	/* smallest counter value to reboot soon */ @@ -151,12 +156,11 @@
> static const struct watchdog_ops rzg2l_wdt_ops =3D {
>  	.restart =3D rzg2l_wdt_restart,
>  };
>=20
> -static void rzg2l_wdt_reset_assert_pm_disable_put(void *data)
> +static void rzg2l_wdt_reset_assert_pm_disable(void *data)
>  {
>  	struct watchdog_device *wdev =3D data;
>  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
>=20
> -	pm_runtime_put(wdev->parent);
>  	pm_runtime_disable(wdev->parent);
>  	reset_control_assert(priv->rstc);
>  }
> @@ -204,13 +208,11 @@ static int rzg2l_wdt_probe(struct platform_device
> *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
>  				     "failed to get cpg reset");
>=20
> -	reset_control_deassert(priv->rstc);
> +	ret =3D reset_control_deassert(priv->rstc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert");
> +
>  	pm_runtime_enable(&pdev->dev);
> -	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> -	if (ret < 0) {
> -		dev_err(dev, "pm_runtime_resume_and_get failed ret=3D%pe",
> ERR_PTR(ret));
> -		goto out_pm_get;
> -	}
>=20
>  	priv->wdev.info =3D &rzg2l_wdt_ident;
>  	priv->wdev.ops =3D &rzg2l_wdt_ops;
> @@ -222,7 +224,7 @@ static int rzg2l_wdt_probe(struct platform_device
> *pdev)
>=20
>  	watchdog_set_drvdata(&priv->wdev, priv);
>  	ret =3D devm_add_action_or_reset(&pdev->dev,
> -				       rzg2l_wdt_reset_assert_pm_disable_put,
> +				       rzg2l_wdt_reset_assert_pm_disable,
>  				       &priv->wdev);
>  	if (ret < 0)
>  		return ret;
> @@ -235,12 +237,6 @@ static int rzg2l_wdt_probe(struct platform_device
> *pdev)
>  		dev_warn(dev, "Specified timeout invalid, using default");
>=20
>  	return devm_watchdog_register_device(&pdev->dev, &priv->wdev);
> -
> -out_pm_get:
> -	pm_runtime_disable(dev);
> -	reset_control_assert(priv->rstc);
> -
> -	return ret;
>  }
>=20
>  static const struct of_device_id rzg2l_wdt_ids[] =3D {
> --
> 2.17.1

