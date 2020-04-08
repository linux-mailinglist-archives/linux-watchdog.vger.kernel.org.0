Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34AF81A1DAE
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Apr 2020 10:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgDHIyx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Apr 2020 04:54:53 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.5]:44329 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726550AbgDHIyx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Apr 2020 04:54:53 -0400
Received: from [100.112.195.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 43/4E-46089-9519D8E5; Wed, 08 Apr 2020 08:54:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMJsWRWlGSWpSXmKPExsWSoc9rohs5sTf
  OYNsiAYvLu+awWdxYt4/d4snCM0wWD3YtZLJ4/PIfswOrx8o1a1g9/t329dj5vYHd4/MmuQCW
  KNbMvKT8igTWjOY581kLZohXrH88n62BcYtwFyMXB6PAUmaJecvWMEE4x1gkTvR3sEE4mxklf
  vf+BHNYBE4wS7TNeQxUxskhJDCPSWLGDlmQhJDAHUaJNdN/gSXYBCwkJp94ANYhIrCNUeLnhK
  ksIA6zQCujxKklfxhBqoQFfCVOXOln7WLkAKryk/jZUg4SFhEwknh0aAdYCYuAisTMRweZQWx
  egViJq7MnM0JstpFoX36ZDcTmFLCVOPF/DjuIzSggK/GlcTVYPbOAuMStJ/PBDpIQEJBYsuc8
  M4QtKvHy8T9WiPpUiZNNNxgh4joSZ68/gbKVJO42vIWql5W4NL+bEeRMCaCT188pgQhrSfxpv
  cYCYVtILOluZYEoUZH4d6gSIpwjse/fbKiJahJXPx2FKpeROLTkIzhEJATmsEh82PKOdQKjwS
  wkV0PYOhILdn9ig7C1JZYtfM08CxwSghInZz5hWcDIsorRPKkoMz2jJDcxM0fX0MBA19DQSNf
  Q0ljX2FQvsUo3US+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzA9pRQcVN7BOHPte71DjJIc
  TEqivI4tvXFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHh9+oFygkWp6akVaZk5wFQJk5bg4FES4
  U3sA0rzFhck5hZnpkOkTjHqckx4OXcRsxBLXn5eqpQ476QJQEUCIEUZpXlwI2Bp+xKjrJQwLy
  MDA4MQT0FqUW5mCar8K0ZxDkYlYV57kCk8mXklcJteAR3BBHTEtaRukCNKEhFSUg1MzVG71z8
  JnhagFjulIP7SorlePicOiBZ0vv+9qenVTLf3D49P32T/7tl+6Z0r53lzMm8LltvSJcLlbLiD
  tyPHVcBGcp7Y88/n+PUuyL/KO1V8uO+Bt07VkoKf20UNDt5j32ph9HjVsUtpU/dbfIrQCT/Db
  ZcW3Lyj7+SCjuMdBfcVzXXbf11W2VS1pmHTOaPIw4WfFvCsf5MorbuuetfdE1+eJTkyrBH9PV
  nr8Lbbk60nH7WZwSNg/nHL/lXLNjJvivZaVeL8YeFB7T+Lg/0btX3LRL2FjmZ4ut9zk5SJNX3
  tsLnt7r3zCacktm7T+7/W4qVk+/1bwjrX25um180R+P/Wv9Dqo9SXexH5Dx6o+yqxFGckGmox
  FxUnAgDEQ/MOVgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-272.messagelabs.com!1586336088!1511286!1
X-Originating-IP: [104.47.13.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5834 invoked from network); 8 Apr 2020 08:54:49 -0000
Received: from mail-he1eur04lp2052.outbound.protection.outlook.com (HELO EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.52)
  by server-3.tower-272.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2020 08:54:49 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN64ha3MfkRqiwigBXHfmspBWlniJtQhRJ6XmNy73skclbxGO64tAJWPjz6cqOQ8wkr5VnckhPXDtouPo0lcGvOjvE8y4G8y0fr5ua2Nc9IlISX+b7xhvJCFe+ighfsmj5YwLsHHbbPwAPKuZksV/mdVnD0MATuW7NkfqkX88dTDIjcOdsMbtyhvL73k9ZXKNDYZRyCODvy2rzQOwYpqx8U1O92Iz/5xDujfTQ10WagQjgs8jQXpsX4QKncV5KJ2vNDkn+6RSt9Z+2dN0J79vmCWYKIFZwp5iR9c9m6NvSFpPeHZoshGizOwgRRaOkuKgaiKq+oZ57ZWI2bEgMVjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEHJyX1rD34zZkqihsRjkZgbssyxKCHO5a1mD15Buf0=;
 b=nASgoBkrJm1i8o9OirqpqO1hoF6Ell3B+Nnj+xQpP/rUkKUNezC5zjzYyY2AIFX3VmT1nCWDCS9LYJY1jaSshs0x1KzNcwK/flahGknWlZdbkjduKcSWqaCHrjQwm7BoKdg/bJn74opdM56Jklj157zY81nD+mWJx9cJR7Njdhgz1g0MWMcXebx45vqkGUiNxqOllJYvzzKq7fgMNL8gIgb2yW9USF+esgxr+MS18B86uDfGsZfK7/C87W6xUBiH0JSfiQfxvKVAcisBLpbATKkbbhUpmgAkCsltq8CPMdm1mp0Ukg0O3tM2EcU+wqN3pBaZv3Epul6RzBXJ9rydow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEHJyX1rD34zZkqihsRjkZgbssyxKCHO5a1mD15Buf0=;
 b=RqT/5ReE8JlTF4cDH+9l0gdPEAEb9/yY6UjbITuyYiElx6MIF2RsWyqWx6bNoZg/Mpn2cnEDPKghstjNEtcA1vGTYghTmtEFVO6u44As+T69wMjIeJ2O1c6+3YRtvgEfiCq6R6jt3HqiDXWOcls39id41n9Y4luc7UGV7DwN010=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52::13)
 by AM6PR10MB2391.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.21; Wed, 8 Apr
 2020 08:54:47 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2900.015; Wed, 8 Apr 2020
 08:54:47 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] watchdog: da9062: Initialize timeout during probe
Thread-Topic: [PATCH v2 1/3] watchdog: da9062: Initialize timeout during probe
Thread-Index: AQHWCbjYHXW9BZB8v0eH8SxcAWnXX6hu8wZg
Date:   Wed, 8 Apr 2020 08:54:47 +0000
Message-ID: <AM6PR10MB22633FAA4A5E067DE777339880C00@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200403130728.39260-1-s.riedmueller@phytec.de>
In-Reply-To: <20200403130728.39260-1-s.riedmueller@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [146.200.27.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 161cba08-4f69-468c-7b7f-08d7db9a7da2
x-ms-traffictypediagnostic: AM6PR10MB2391:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2391601CBB6E7BDE605DFC84A7C00@AM6PR10MB2391.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39850400004)(396003)(136003)(346002)(55016002)(33656002)(110136005)(26005)(478600001)(54906003)(4326008)(7696005)(9686003)(316002)(66946007)(186003)(76116006)(2906002)(71200400001)(52536014)(5660300002)(66476007)(6636002)(66556008)(81166007)(64756008)(55236004)(8936002)(53546011)(6506007)(81156014)(8676002)(66446008)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GHvV0rCgJIHNUvHzO8Y3qJpOMrHCOxPvPi0uso26jXsaiFNusIGVdcRf7mpPjoxJndRtRr7ZMx/rcCAW+FZWs2MOzcVI0GyodFIn6oWXr18KTDhOXcy+rp2nE8TrUqw8Pi2u4+7PKcebV6gItQhEm0Ar4kWgZftygdVzjFQD3OWiN4596TnGxUgevqJ3eDOjKYhTzfTzc7Pr3p58cFVuoV/+HBgzjxyr3fXAxgCYTThmYUu1oqZVJHu7JA9/xywfaPJaXSggtztrEcHaAXDKSrIVrc4fTi4JT8M3leG3QjNCMeZ0OGWotCer5JHiEmIjTrgMO3ZGStPVliSApe9erNHHSBanmZY6hJyVAtGq3O7poQ4JPohUl7lZrDrwxgbVjSF6Ki6iQZ4Vtid34qG16T/nXSNLIDYSAg56akKVGGdsqhOvWjFQqg4zwX7A2iAn
x-ms-exchange-antispam-messagedata: 7cs3FeGG9Pg1CYXmX4E9JMYw2Tbj74d3+gLpPPkkV/XMghDFxSKRcKjV8t5Yn2rwSc/N+RXZp2ORSZJ9+L9iyi/3T19tsJESwcPoOwxozawiujcgUAI4W/MJAq1RFSgv+48JSTYLYaMNZIq8pRsKtA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 161cba08-4f69-468c-7b7f-08d7db9a7da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 08:54:47.4222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrfN0WBJ2hE7Ers7lp/xfs1c/9qLvP2qQwdgJAsu8ACHzENVUUId2rYAjrdG+wNHBp+e8t8r7SduWywRnoiFhS8Bsl9kugnNKhY0GmuIZX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2391
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03 April 2020 14:07, Stefan Riedmueller wrote:

> During probe try to set the timeout from device tree and fall back to
> either the pre-configured timeout set by e.g. the bootloader in case the
> watchdog is already running or the default value.
>=20
> If the watchdog is already running make sure to update the timeout and
> tell the framework about the running state to make sure the watchdog is
> handled correctly until user space takes over. Updating the timeout also
> removes the need for an additional manual ping so we can remove that as
> well.
>=20
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Changes in v2:
>  - Reworked the patch to use the pre-configured timeout instead of the de=
fault
>    value as a fallback in case no DT value is present.
>  - To achieve the previous point watchdog_init_timeout was added to get t=
he
>    DT value if present.
>  - Added a timeout update if the watchdog is running to set the desired
>    timeout and in this instance removed the manual ping at the end.
>  - Removed info message.
> ---
>  drivers/watchdog/da9062_wdt.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index 0ad15d55071c..10b37dd65bed 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -35,6 +35,15 @@ struct da9062_watchdog {
>  	bool use_sw_pm;
>  };
>=20
> +static unsigned int da9062_wdt_read_timeout(struct da9062_watchdog *wdt)
> +{
> +	unsigned int val;
> +
> +	regmap_read(wdt->hw->regmap, DA9062AA_CONTROL_D, &val);
> +
> +	return wdt_timeout[val & DA9062AA_TWDSCALE_MASK];
> +}
> +
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
>  {
>  	unsigned int i;
> @@ -183,7 +192,7 @@ MODULE_DEVICE_TABLE(of,
> da9062_compatible_id_table);
>  static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	int ret;
> +	unsigned int timeout;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
>=20
> @@ -213,11 +222,19 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
>  	dev_set_drvdata(dev, &wdt->wdtdev);
>=20
> -	ret =3D devm_watchdog_register_device(dev, &wdt->wdtdev);
> -	if (ret < 0)
> -		return ret;
> +	timeout =3D da9062_wdt_read_timeout(wdt);
> +	if (timeout)
> +		wdt->wdtdev.timeout =3D timeout;
> +
> +	/* Set timeout from DT value if available */
> +	watchdog_init_timeout(&wdt->wdtdev, 0, dev);
> +
> +	if (timeout) {
> +		da9062_wdt_set_timeout(&wdt->wdtdev, wdt-
> >wdtdev.timeout);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
> +	}
>=20
> -	return da9062_wdt_ping(&wdt->wdtdev);
> +	return devm_watchdog_register_device(dev, &wdt->wdtdev);
>  }
>=20
>  static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> --
> 2.23.0

