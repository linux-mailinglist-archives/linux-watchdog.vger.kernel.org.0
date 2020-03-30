Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD134198160
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Mar 2020 18:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgC3QiM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Mar 2020 12:38:12 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.113]:61163 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728985AbgC3QiL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Mar 2020 12:38:11 -0400
Received: from [100.113.7.84] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-central-1.aws.symcld.net id E4/1E-23255-F60228E5; Mon, 30 Mar 2020 16:38:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFJsWRWlGSWpSXmKPExsWSoc9grZuv0BR
  nsHO7uMXlXXPYLG6s28du8WThGSaLB7sWMlk8fvmP2YHVY+WaNawe/277euz83sDu8XmTXABL
  FGtmXlJ+RQJrxqrOz8wFp6Qq/u1dyNrAOFusi5GLg1FgKbPEpv8nWCCcYywSe6b9ZoZwNjNK/
  O79yQbisAicYJZY/v8okMPJISQwiUli21R7kISQwF1GidYP31hAEmwCFhKTTzwA6xAR2MYo8X
  PCVLDBzAKtjBKnlvxh7GLk4BAWiJe48asQxBQRSJD4/UcApFdEwEji9q8usAUsAqoSHdO7GEF
  sXoFYiSVT2xkhFhdILHq7lx3E5hSwk1g3cztYPaOArMSXxtXMIDazgLjErSfzmUBsCQEBiSV7
  zjND2KISLx//Y4WoT5U42XSDESKuI3H2+hOwyyQEFCVWLwyDCMtKXJrfDVXiK7FpzksWCFtLo
  vHTUai4hcSS7lYWiFYViX+HKiHCORKLf6xig7DVJHoWtLJD2DISZ7ZOBAeuhMAcFoldi3cyTW
  A0mIXkaghbR2LB7k9sELa2xLKFr5lngUNCUOLkzCcsCxhZVjFaJhVlpmeU5CZm5ugaGhjoGho
  a65rpGpoa6CVW6SbppZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQITVEoh27QdjFfWvtc7
  xCjJwaQkyvtCsilOiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvpQxQTrAoNT21Ii0zB5gsYdISH
  DxKIrwSskBp3uKCxNzizHSI1ClGY44JL+cuYubYeXTeImYhlrz8vFQpcd4yeaBSAZDSjNI8uE
  GwJH6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvJshCnsy8Erh9r4BOYQI6JbC5HuSUkkS
  ElFQDUy4TW8w8RrmH/KJH2Wctc1huvlhMg39zTUjLrP9Sq+bNn/thgaVXY9z2Z/9f8ZiEHwp/
  EhTyUe26p1bEwaNZRc9ZAwIzJbfeLamb4Drlb9o/lon7d6bdLDQ62vV5cciC1twHVV95PVj/R
  JSsuLPilm1b3fm0p+sjs1wmz/4s9CUvRjd1vrKP5LRLK6LvvztynH/fo/LilSJpa5KXHIzeHi
  4/2WmKjUYYe9/WycnrXjV8ONjzc3ZwVtnDS/uzUyNzLCdO8Ioru3W58QGT0VYz5b9P67oNu7X
  dI88bx2cecu++s75pxodD61c9fuWemvPhxgovr6W31Np/y89+UHpv15vAKgsOacsqwZmTbDwu
  2yuxFGckGmoxFxUnAgCMJ4d0XQQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-25.tower-249.messagelabs.com!1585586286!503413!1
X-Originating-IP: [104.47.0.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1754 invoked from network); 30 Mar 2020 16:38:07 -0000
Received: from mail-he1eur01lp2059.outbound.protection.outlook.com (HELO EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.59)
  by server-25.tower-249.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Mar 2020 16:38:07 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cThg1r5PMhiH7CTLM97g9Kx8BxrJ8HNQ1RzIrW9zes6YtABTx3df1nZjc/kCDsFZ51jEt+HUSkt51sG0o4Na0iplIlIzHc+TvYamf7Gm1AjtyWnQyUalhpaDWQ+Z+UdpSoJBFFxex+Vn0XRdOSXCBE29u3xtqgQ1F5dJV9pBcB42OO2ksvywTqF1XdXIoB9mWOp5pGY8fmsT9pEANdtb8qqUCrdo3c7//Fm+7fSnIcRDM2MgHBKsNiehWHpcyOmlmLmY9my36dCD7oCaRcDtozp0XarbocpB+tjxIYmF8FFLBS5YRvdPJegKFnUZExfAERCsYZVTsDthd8Zgppz6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMyrezDIk9f+ggkyPqmstMcYVz2aDdQYT7hgdLT0wCY=;
 b=DZ8729JBxjzg8Kc2ZI+2sQ5+mXm1p4CW2yEzKfU1FGpC7hJkFUrzZ9KmpqzrMGEuq1VKqALFgYwM7YeeUS2SjdGtvFGKoj8mLnoBOuYvSfGKHhGZ4ksK0WFx/22ErjEq66kgbB2ZDt3YR3Qh19C1GEUEFn9xkqAeAshYHLLlLlbwpeo4MA68V7DqqD/D/ZEmsq63gxPSzYOIASLJNzvtHfSM5uDPwaywtcGXwaUvBMb8djGtnS0XCYlb0lDkFxqnzAwkTXiN1bQlEFP7R7mmHuJgB0Bu0HlV2UG5qfQk9swvL3LEUAKdOFAzpPHIaCGgRA7lpQkvpnxuGm3i4d/c3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMyrezDIk9f+ggkyPqmstMcYVz2aDdQYT7hgdLT0wCY=;
 b=wYpQ2PJiERtfqU/C1/pMmY4VF7UsVb98cNMfc5uq5vv+s5ka3TKwQDX+Xv+nvrpogMz0EwkpB9DIuILN25CC3mR4Ahzfwr28rcYNbhQcTAuiDlZUCSS+gZ1cSn00s6Rfu7gln3wJBiupv8t2SYtyxn+MHnAJxnfmq+ie3TIC7Qw=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2183.EURPRD10.PROD.OUTLOOK.COM (20.177.112.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Mon, 30 Mar 2020 16:38:04 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 16:38:04 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] watchdog: da9063: Use pre configured timeout when
 watchdog is running
Thread-Topic: [PATCH 2/3] watchdog: da9063: Use pre configured timeout when
 watchdog is running
Thread-Index: AQHWA3+ctCJCv4aIsE2ECSceYvSLuqhhW4Fw
Date:   Mon, 30 Mar 2020 16:38:04 +0000
Message-ID: <AM6PR10MB2263A1A76AFFBCE7BCC4B93880CB0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
 <20200326150203.371673-2-s.riedmueller@phytec.de>
In-Reply-To: <20200326150203.371673-2-s.riedmueller@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [146.200.71.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f8bdbd5-7676-4365-3297-08d7d4c8b851
x-ms-traffictypediagnostic: AM6PR10MB2183:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB21831306029EFE3CE5BBC7C5A7CB0@AM6PR10MB2183.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(5660300002)(110136005)(6506007)(54906003)(53546011)(6636002)(33656002)(186003)(26005)(71200400001)(55016002)(9686003)(4326008)(7696005)(66556008)(64756008)(52536014)(478600001)(66946007)(76116006)(316002)(66476007)(86362001)(66446008)(8676002)(81166006)(2906002)(8936002)(81156014)(55236004);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yocQmD0OXd5TS22fZme4doSx1qK9J73cMXZvjqI1hCcJ6vt4gA1IkqhX4k2xg+zIiJg58oTRBurVdaXJjPzF8PBknCc9K9WSQs+p4A0di+7dxCHzTdiBmq8gWQ9WjXvrfwRTZ7P6q8f6KvtRUwrR1eL1yQv8Tg7duFY10lQ53GVazAy/E7OZLwdfhimALfAmBY0rRcBUSPpv6sUaq8lqHN7nWSe2Jq5hmWOIXFuchQOICNGoyDfWLP7QaQS5W9Aezg/8Fe5pps7YksKnaRDBM7QWCOg4g+fijTBlg/ylfrL489qzaEv4/Fk4dWk16TJSqc93WNNPav8rF/pLNdvQQjlocUXMhShHmKjVPcr5AUT2f30aKwO2zA+ne+uqfF6x3UoEmX6FS+ISsEO6qTwZw2DhkQKnCvYWIbcChsZqUbj+4eFtu3/+jP6r/s12QSD
x-ms-exchange-antispam-messagedata: qhHUdNo1Yx2VtQnZk/DYpmGcUL6s++OxKFWoA7A8BZYu65P/ClOsIKeP4cEF8P6XrXz5UzSxUhzYvrydTaEI9X9wrae61IuRbWSGszaQealYELiVPhA8QfupXlepkjsLEoGFCBLDV01lYn4JdckWnw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8bdbd5-7676-4365-3297-08d7d4c8b851
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 16:38:04.6361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x//dXQy7pYpIcf5+nJ+lRdDFYDQ2kUeUH0Hd6quEsQScJyTorvXWVf2uJeG8m6FKoQPxbRZANNk/hQBa69DetIszNH3vZb5GV0kMBW9nhQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2183
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26 March 2020 15:02, Stefan Riedmueller wrote:

> If the watchdog is already running during probe use its pre-configured
> timeout instead of a default timeout to make sure the watchdog is pinged
> in time until userspace takes over.

At least for this driver I don't think there's an issue here with regards t=
o
not pinging in time. Calling 'da9063_wdt_update_timeout()', as it currently
does in the probe() when the watchdog is already active, actually disables =
the
watchdog before then setting a new timeout value, so by that method we're
avoiding a timeout and starting a new timer period.

To my mind the timeout value should come from DT if possible, which I would
assume for the most part would match whatever is defined in the bootloader =
as
well, unless I'm mistaken. If that's not available though then I would mayb=
e
agree on falling back to a value that was already programmed in the bootloa=
der
rather than the driver default which should be the last resort.

>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/watchdog/da9063_wdt.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.=
c
> index 3d65e92a4e3f..34d0c4f03814 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -46,15 +46,16 @@ static unsigned int da9063_wdt_timeout_to_sel(unsigne=
d
> int secs)
>  }
>
>  /*
> - * Return 0 if watchdog is disabled, else non zero.
> + * Read the currently active timeout.
> + * Zero means the watchdog is disabled.
>   */
> -static unsigned int da9063_wdt_is_running(struct da9063 *da9063)
> +static unsigned int da9063_wdt_read_timeout(struct da9063 *da9063)
>  {
>  	unsigned int val;
>
>  	regmap_read(da9063->regmap, DA9063_REG_CONTROL_D, &val);
>
> -	return val & DA9063_TWDSCALE_MASK;
> +	return wdt_timeout[val & DA9063_TWDSCALE_MASK];
>  }
>
>  static int da9063_wdt_disable_timer(struct da9063 *da9063)
> @@ -191,6 +192,7 @@ static int da9063_wdt_probe(struct platform_device
> *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct da9063 *da9063;
>  	struct watchdog_device *wdd;
> +	int timeout;
>
>  	if (!dev->parent)
>  		return -EINVAL;
> @@ -214,15 +216,20 @@ static int da9063_wdt_probe(struct platform_device
> *pdev)
>  	watchdog_set_restart_priority(wdd, 128);
>  	watchdog_set_drvdata(wdd, da9063);
>
> -	/* Set default timeout, maybe override it with DT value, scale it */
> -	wdd->timeout =3D DA9063_WDG_TIMEOUT;
> -	watchdog_init_timeout(wdd, 0, dev);
> -	da9063_wdt_set_timeout(wdd, wdd->timeout);
> -
> -	/* Change the timeout to the default value if the watchdog is running *=
/
> -	if (da9063_wdt_is_running(da9063)) {
> -		da9063_wdt_update_timeout(da9063, wdd->timeout);
> +	/*
> +	 * Use pre-configured timeout if watchdog is already running.
> +	 * Otherwise set default timeout, maybe override it with DT value,
> +	 * scale it
> +	 */
> +	timeout =3D da9063_wdt_read_timeout(da9063);
> +	if (timeout) {
> +		wdd->timeout =3D timeout;
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
> +		dev_info(da9063->dev, "watchdog is running (%u s)", timeout);
> +	} else {
> +		wdd->timeout =3D DA9063_WDG_TIMEOUT;
> +		watchdog_init_timeout(wdd, 0, dev);
> +		da9063_wdt_set_timeout(wdd, wdd->timeout);
>  	}
>
>  	return devm_watchdog_register_device(dev, wdd);
> --
> 2.23.0

