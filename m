Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CFB48460F
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Jan 2022 17:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbiADQip (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Jan 2022 11:38:45 -0500
Received: from mail-os0jpn01on2090.outbound.protection.outlook.com ([40.107.113.90]:23106
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235378AbiADQio (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Jan 2022 11:38:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6/Fq/PvUqLtYb8Rm6aIFgmtdhBrynvQxQkkueIkvPLdd/o+VHlXxAcZcgsEAAwRcGMnobBP5fb1+Fa9Oezq1QBG8+SG1SSLRyUCNjGTyHH4BDU8OTX9kLz2OOTb1CcF6tCFAdbnO7QV7pheXi/9sUZX39SQEg0qpIn1lFdvgbUZBVuOEp9tCKHVbY/f1Skz6rnP6Q9CQZsu+COgV+ZSw0sTgx30O5ojoWU1zfZzC9tSkTMcy1d5SIgd/j9SHP/xOZy3PGY1WlBXzOchq2veOw8M/7okakd8Pogh/w2wAh0M+nLOnCEJVSaKlW6KDR2iyQsSiH/klV6F8FaFukpAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH4Ge4mgllUsGcgC7pnBIom/+70ww/D8/35rg+e9UVU=;
 b=fS+I28EpC8AqhVIrdVRQP8yNMncjm7kLqgFgoS1bmoLHKmhE+gL+yEZd8Z5Z1fIWY1dFlxZvsP7w8vHKwkdVH7J4GY23zeSXRIQO3be4Ih4VL+qhLmryesLIf+bA1ujKGUFgZE+1SmQUoyr8pmj2gvU60Xw5C3vG82G5xf1F0MsuiPaUe66l3yHtNcpzdz61+yyDUaIY1QYnElZrLBSpO6w4PTYUEtAodZmwgXaVmwFtwQs6RjPdyHpFSEMauAcFvIi+VA73fBYVCFh79++XczSJZkc8D/AQKnMfVL+89TMR1at3CKBwqW0drJQMyq/BsjcXSQPfuLqpTVXhH//jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH4Ge4mgllUsGcgC7pnBIom/+70ww/D8/35rg+e9UVU=;
 b=E5B+QKxjvmzh/VpSM9hvaRiFLPbws1Feqaiq9QvthQe2YB15hvPiNx4DP77KSR5znRLa2s5DGUk5kD1YzjKTQT7lt6D/WKmfdUQpWhxnUb+h2sm4ip1tLOQCzjdt3KbJ2zqqmoQ1sAWFkvNW2mE3CJ90Qw0wAq0mDXVVw2JAbWg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3080.jpnprd01.prod.outlook.com (2603:1096:604:1d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 16:38:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4867.007; Tue, 4 Jan 2022
 16:38:42 +0000
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
Subject: RE: [PATCH v2 4/4] watchdog: rzg2l_wdt: Use force reset for WDT reset
Thread-Topic: [PATCH v2 4/4] watchdog: rzg2l_wdt: Use force reset for WDT
 reset
Thread-Index: AQHX8DXos7yC0F/gWECD5xP9Xbozp6xTMhTg
Date:   Tue, 4 Jan 2022 16:38:42 +0000
Message-ID: <OS0PR01MB59222B42E58423B09D145B4D864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211213152658.26225-1-biju.das.jz@bp.renesas.com>
 <20211213152658.26225-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211213152658.26225-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 822b5ed0-8beb-4727-93c1-08d9cfa0ab8d
x-ms-traffictypediagnostic: OSBPR01MB3080:EE_
x-microsoft-antispam-prvs: <OSBPR01MB3080760BFBB7AD822D3BF72D864A9@OSBPR01MB3080.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YP96EWfP981p+22ateP06E+i+zV1xqXTOLB3nBvtHaQFb2d8hk3cUUxZqLd+TNeyl84JvCu4zFe6Yxz6g7drJgE+bG23izlgOm3BTzvGl94LZZcW7/8VeTjjjM+VZ9a09dkAaAgWzOTTC/Zh8I7SHk2p20cqY+qIKwg92pgQKXQhGRmaOcIicRZBZLw+DXqObmgnoOsjRlCSc4Rrkwvpau1J5zgC1B8gxH4k+EB5zBn9WtU7h9XvRjNbISCPjbnNVjx83JqGATphlKqrVYfdkAyBSR9jtc4IfGPFAOhhLxyvuru63jeWC0fism4WH2Zpe0Xi34rLKVVR66rdatHHk+1qxMnAQCBJN52regGwF+mB6J8ouUFyHM4Ps1dnmiIb8vqeBLS6j9udGdHYXrqz0QkZTNAInNc48b7jo9Hehz3qAKvISy41mqMIV9UtU7s/VpOCjIxB88+ZKzo0MQrWLhnawnexec4oDEeUZ5ybiqltsNSqM7DYNkx3A1SGApR3WABagxaQ8zH550sR8zUy4qXY/j6nPqjoLjZudUf4MeWh9F2jsHmVZ+fvecOJiOOzisbEhsqLUu+q0hNQGU43DBKvLrmgD3G587MqsPP5ZBqgsbAN51vBuJ4MmnCeOrOaw+YpCVRbMC95DlAY3YgPaie9DTox3PaJnkw9UfreFMOkpKLAUgFtJz1Xtkn9GuJEBKpK5CGYbCOeY2N2jjNjIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66946007)(66476007)(83380400001)(2906002)(8676002)(6506007)(8936002)(316002)(110136005)(64756008)(38100700002)(66556008)(186003)(76116006)(54906003)(86362001)(26005)(7696005)(71200400001)(5660300002)(33656002)(52536014)(4326008)(122000001)(55016003)(508600001)(38070700005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A3mzQQ6O1+aK/w1N7Mq4UJetMhVhQKlD3JvJ7ReQEjloa9uHT6egpngP+ybr?=
 =?us-ascii?Q?+liBj56Pf7nlwIl42YEHj7oDo4PccQD6dZPeDLrpWEZjUCyjHJ7Yf5OI9++D?=
 =?us-ascii?Q?plQQXwBuzYj+BdQS47fuA6KW+lsLR3VnN/PdKy3LN9Q2uyKk8Ctp7F+L/t5W?=
 =?us-ascii?Q?jlfkIV9Xo7jpuMsSNmVtVniqJ9yJB+dKihfC4TR5BgrnruMVfHr4lX2byHyT?=
 =?us-ascii?Q?Akye4TBpj4pR2QN5ICcGxF0PXBvPIsRlr3e9TxV1f4Imxl7Go5+N0AyaLz8P?=
 =?us-ascii?Q?XCUeNjVe82WGDwXD8ON8vGAm4iW5jtAaOpkhmg6sdMUNo1xZC3APmzv6L+co?=
 =?us-ascii?Q?BgJ/+eEBRMlmlkyht9KjEPuEQ4rANUv4oDNTmbc9G9z/ell9WGZywbfX0zIe?=
 =?us-ascii?Q?G5cWBqqyh8AIndfvoYjMZdZgo1sS1HGbQB/SP4+VCOyRh/i49lM92ff0A0PH?=
 =?us-ascii?Q?ecdtXQmDwfXx773R2UDLz0OON37eo+jOaakEEJG0YmRQv3K1QcsQ5r3fH6tT?=
 =?us-ascii?Q?W0ryzUuD/NBnqvn6woOKfYj/yBmiwUe0Z/swPYQvIxAj21ha6Dva6B39HNNR?=
 =?us-ascii?Q?5L6UX26DnnRRPCrMGjTGL8Zeum29MiIy4UngBPi2JbW/2rUE4zVHZOJYlOrv?=
 =?us-ascii?Q?SumC8lI9kD9QoqFjgt1jw+M8hMFxD+GOKOpquUpRkzfImbPzyAE0Q/qkxeyB?=
 =?us-ascii?Q?Ayr8QtMpl9Jl5NYy6cgcQe7cTrEJI1FRHroD/EstHwqHTeyRgTkVyr+qAQB4?=
 =?us-ascii?Q?0apmxRe9aKLKLh6h1tjZMD5ZsaD0f6q4ik7P0PimC95HNRHLd8a+bYhI5uEl?=
 =?us-ascii?Q?slV4/07PumwXsFbrrAxWGRQiquqJn0wcDS8IGCT9EbN9GM0lHkvthCa6fGDn?=
 =?us-ascii?Q?Ke7ytlOp/BNrzeMfxMPCHKOOZoRgKC1xFaaOLmRCP0XbqvyUrApUP/NEheQ8?=
 =?us-ascii?Q?fvD7puXpzJ3uZH31CltFtd5JpgN9ijWja4p5WI380OcBecXzYvEmpIhY8Hcq?=
 =?us-ascii?Q?VcJYyd+Jec2dojdRkmmECz3HSmHJf9dmYwwBol1jX1DIzoklbGdCB8iEbxyj?=
 =?us-ascii?Q?KXuVHPWzkYOZfTNLHb5V796pmXFQ40gZ0f7TFk8sX/mXG+lQ6RZRsxTFixRn?=
 =?us-ascii?Q?YlK8LiOsZT0f7h5j5t8HodUakqVjPuPnWz96F3UMkbmqksXW0XRSNLZMD7LY?=
 =?us-ascii?Q?tQBlvyP902IWJnzWdZmr+IKA+0g5PvIT7NVN+7QTOqOFaO0MHHfml8fVijig?=
 =?us-ascii?Q?GgEk54p+sVLrlQTW0nyKpu2+YhOfSVJooU3825KfMrg5UlGP+NZL512zwkV3?=
 =?us-ascii?Q?luNImwiPq3lnVvhDIaeMLqTc1JUiIV1pyOqEA9/R53Azi0es6R/oZ0/d+mYS?=
 =?us-ascii?Q?pVWKoR5rPl2dpNboMIkKt4Kvej6NUaiJNNqqqevlQhZwfVURlRjqUqivZaTq?=
 =?us-ascii?Q?wmmVMbieu4cjRK0BOSIAcjOZa4LkjFpvnKGmqdD0zENaw9b94ON4pGcEeutv?=
 =?us-ascii?Q?GVQZ0w/+5n1ld+SoCFq7D9qcwFgl+H29ZZQ7abWY5ZArUnEtReAeeWojsX1c?=
 =?us-ascii?Q?bfQuaEKyuwm0Bu0rIhEyOYyMyFIzIk96kPZRFNEBT6SF2/+VO9XPAKAQR1Ou?=
 =?us-ascii?Q?GWtIet/F9+93v7lzkUNvU/yLFH50BfDeg9dYDwW7qZ3KMTuUj5lWURyVwFXz?=
 =?us-ascii?Q?IKxlMg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822b5ed0-8beb-4727-93c1-08d9cfa0ab8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 16:38:42.8606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z25AaIcoA/Fqsk44FGwpTiKePxyY466SdZ1QUMDheJXIXHMnZ/HVQ2CWy8wFuJGlYefWByLNnlNZfDEwfYqwCmTu8sD1EIM2JmF53jonhKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3080
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch? Please let me know.

Regards,
Biju

> Subject: [PATCH v2 4/4] watchdog: rzg2l_wdt: Use force reset for WDT rese=
t
>=20
> This patch uses the force reset(WDTRSTB) for triggering WDT reset
> (WDTRSTB). This method is faster compared to the overflow method for
> triggering watchdog reset.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V1->V2:
>  * Updated the commit description.
> ---
>  drivers/watchdog/rzg2l_wdt.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index d1b5cb70d56c..94f98825ab8d 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -21,8 +21,11 @@
>  #define WDTSET		0x04
>  #define WDTTIM		0x08
>  #define WDTINT		0x0C
> +#define PECR		0x10
> +#define PEEN		0x14
>  #define WDTCNT_WDTEN	BIT(0)
>  #define WDTINT_INTDISP	BIT(0)
> +#define PEEN_FORCE_RST	BIT(0)
>=20
>  #define WDT_DEFAULT_TIMEOUT		60U
>=20
> @@ -141,22 +144,12 @@ static int rzg2l_wdt_restart(struct watchdog_device
> *wdev,
>  			     unsigned long action, void *data)  {
>  	struct rzg2l_wdt_priv *priv =3D watchdog_get_drvdata(wdev);
> -	int ret;
>=20
> -	/* Reset the module before we modify any register */
> -	ret =3D reset_control_reset(priv->rstc);
> -	if (ret) {
> -		dev_err(wdev->parent, "failed to reset");
> -		return ret;
> -	}
> +	/* Generate Reset (WDTRSTB) Signal */
> +	rzg2l_wdt_write(priv, 0, PECR);
>=20
> -	pm_runtime_get_sync(wdev->parent);
> -
> -	/* smallest counter value to reboot soon */
> -	rzg2l_wdt_write(priv, WDTSET_COUNTER_VAL(1), WDTSET);
> -
> -	/* Enable watchdog timer*/
> -	rzg2l_wdt_write(priv, WDTCNT_WDTEN, WDTCNT);
> +	/* Force reset (WDTRSTB) */
> +	rzg2l_wdt_write(priv, PEEN_FORCE_RST, PEEN);
>=20
>  	return 0;
>  }
> --
> 2.17.1

