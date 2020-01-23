Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56892146C3F
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2020 16:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgAWPDt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 Jan 2020 10:03:49 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.68]:44747 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgAWPDt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 Jan 2020 10:03:49 -0500
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 5C/1A-23082-1D5B92E5; Thu, 23 Jan 2020 15:03:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRWlGSWpSXmKPExsWSoS+Yp3txq2a
  cwclJ0hYv5gRYrJq6k8Xi8q45bBY31u1jt3iy8AyTxYddV5kd2Dz6/xp47PzewO7xdOMJJo/P
  m+QCWKJYM/OS8isSWDNWzf/EXvBWsOLIke1MDYzf+LoYOTkYBZYySxzszehi5AKyj7FItCxZx
  Q7hbGaU+N37kw3EYRE4wSxx984SMEdIYCKTxJO5t1khnLuMEr+2/mICGcYmYCEx+cQDsCoRgW
  +MEjc2LACrYhbYzihxoWMJC0iVsICXxNFXr9lBbBEBb4lJix5D2UYSG893gtWwCKhKdDzcBTa
  VVyBW4uPxtcxdjBxA66wl/q0EK+EUsJF4+P4ZM8QXshJfGleD2cwC4hK3nswHa5UQEJBYsuc8
  M4QtKvHy8T9WiPpUiZNNNxgh4joSZ68/gbKVJObNPQJly0pcmt8NZftKrFy9kQXC1pK4f30TO
  4RtIbGku5UF5DQJARWJf4cqIcI5EjsPXIFqVZW483wBM0SJjMTDznRQiEgIfGeW2LXmI9MERo
  NZSK6GsHUkFuz+xAZha0ssW/iaeRY4IAQlTs58wrKAkWUVo0VSUWZ6RkluYmaOrqGBga6hoZG
  uoaWZrpGBkV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYKJKKThyagfjoa9v9Q4x
  SnIwKYnyWrhqxgnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4OXdBJQTLEpNT61Iy8wBJk2YtAQHj
  5II75XNQGne4oLE3OLMdIjUKUZjjgkv5y5i5rh8fd4iZiGWvPy8VClx3pcgpQIgpRmleXCDYM
  n8EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3v1bgKbwZOaVwO17BXQKE9Ap5TpqIKeUJCK
  kpBqYtNar1RhJ2nvevPBiVvUjtyfVEa/FMyce9bRpu9t9J3XFv5MnEjSbbq/tiTzhMH+X7nOf
  qK1HvmxM3rao6eExOVl58TNi0+Y/c2XQ99Y3VV20ru6gVUDFRN38ryu/eETabLTJ5sw9+1lqz
  aL4tSEPlHeLfX73JE8382O+ohVz06s3LvEK3XOOLdWXnfb8dBUnT1GB/J3CmK3f55zxcUo+tP
  EpF/+Hnu3aDevDRZsWVccomv9Q/i4f/GTNzW4zieaENzcL3EPVSm7tOWEt4dwkGKzvL3r5IZv
  NgpSTHxn/+u54ceB4879r+Y/lGzpqTj0PfHZN/9jnRzat/370/qzmX+j/m1Fh+v54g+ZqoS2P
  lViKMxINtZiLihMBPt3YQWEEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-25.tower-282.messagelabs.com!1579791825!535549!1
X-Originating-IP: [104.47.17.110]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16834 invoked from network); 23 Jan 2020 15:03:45 -0000
Received: from mail-db8eur05lp2110.outbound.protection.outlook.com (HELO EUR05-DB8-obe.outbound.protection.outlook.com) (104.47.17.110)
  by server-25.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jan 2020 15:03:45 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCo9DT0CavpJj5J9S6wPRzPs852QC67bKpnSp1NnJDb0Vn26j1QvGP8j4tIZ+JEPDlibOevsFKG3kgA66JEOQZ1bACUL73Eup2aDKFro67PRI//UMEYpPIWdfD2oqz83d6jIQiXB5Ayz9PcY7Spj3xFljJfGiB0DUySrSybFmfcK4TN7RYscq3NjBT6dhKOF94Rnd/Zga/c6wGGG0XypiRmWlImK9TKK/CKHLxDREdt24JThKLklsia0MjTB8JhQ4e4UuHkrq894LLUTtP7oDyoTzsOFxbHPcFcWxzPzLFsSx4KI5qEfQLwR3VX9PoXPRqI7bpg/zruD4xv1KwNmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlRqOAFQayoBXHen/fZ3rneZc9kpnBsVg4vaZAs8vR4=;
 b=anHwUX99JO/iZwtqWb5Ka3H86vam0wkrIU7dnwOspcOqLJfN9Xzz9KFERHAFB/1V6RYiBz5VEPM3fgq3hr8eKcG3FDoMHWXBYHsZ69yFbIe6BN6T4IERTKU3xfCQbWn6A/6NxP4AU5SlmuoGMmZSRWVG5jgnKxpH+gKtQv7NV4aJlW0LSmKMqNnEgoVWhTrstVppfUo63WbV9V7xuI9QikGzdX1VbUue8G/nc6yQ8UkCaGa7YH9YLert6/SUQYGDPv6cwNKEGbSgmWJN01HCIsEJF01A6JyqB6U8MqtKb2nGuIgg7zErNq0+/6CI/HGluokwJACleHmZMNYLi0/7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlRqOAFQayoBXHen/fZ3rneZc9kpnBsVg4vaZAs8vR4=;
 b=M0kGPTofL8vhrkVSvteqh2yT15qGKEZvNuzrXwMID/WFfCuHamqbc08aOcEvsTGcJ2xUVSNAauIueOnIx50jxrJnJd70Kpvzf92M1L9shMOLh4LcC5nRZvs5ma2pAmKapyhUjYs4bJswjaRylPMWRZ2sCU1SAsq7gfuoGOrReWk=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2103.EURPRD10.PROD.OUTLOOK.COM (52.134.118.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Thu, 23 Jan 2020 15:03:43 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2644.027; Thu, 23 Jan 2020
 15:03:43 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "contact@stefanchrist.eu" <contact@stefanchrist.eu>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: da9062: make restart handler atomic safe
Thread-Topic: [PATCH v2] watchdog: da9062: make restart handler atomic safe
Thread-Index: AQHVy8AZrIm80Z5wI0Soa5b+stqPP6f4ZI7w
Date:   Thu, 23 Jan 2020 15:03:43 +0000
Message-ID: <AM6PR10MB2263127E716960B24D26DE76800F0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200115162307.7336-1-m.felsch@pengutronix.de>
In-Reply-To: <20200115162307.7336-1-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a62fc667-9fc5-4881-dacf-08d7a0157063
x-ms-traffictypediagnostic: AM6PR10MB2103:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB21036FD7F7C212B6388CEE58A70F0@AM6PR10MB2103.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(189003)(199004)(55016002)(8936002)(71200400001)(186003)(66446008)(64756008)(66556008)(66946007)(5660300002)(66476007)(4326008)(52536014)(76116006)(966005)(498600001)(7696005)(9686003)(26005)(8676002)(53546011)(6506007)(33656002)(55236004)(81156014)(81166006)(110136005)(2906002)(86362001)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2103;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lRoOSI9PbBMWBpLhvjT7gggr8V/GfyXwFO+esG9zqTjDf9Mbiz+gKRs9fTQrNKI7L/E1DSs46ibicsFxhtgzhx4/TvTgT8vqE2qixUkfmbRPP51EvOOVU6QKxtNvB1yBEwO0FEQuLx/Axe8eFq0iB6tUoHoeUEZhR8ARN+AZGtrLEuYXkah1/C82OzWb+PbAPwsCB420ziGONOdVA0pLsrzbFgdaEcLpjybLI7zvrtjRdO0ECk0oRDcgisFnPOogI2dW8f0ehGYQ3bmxTDIO93mwWNy2VhgujmORIbHJJZPGzpJnwupyI0SdHAP1MAtQCr8rYCt8Vj3/AfV2FvzgtK7TOiSR0IYDyjqc8ChAp88ZYKWThNOGCU3uBOEfC0VnMGfd8pl0M/yWbI5AUdr8NEsMnLlJG2nBActjpq489r7PU3UktgcsLJ9bMA9bk6ICTBr9YxxaTAoQIH80fhH15FxsxLkNL976THe9H2vjsbY=
x-ms-exchange-antispam-messagedata: EHxzCt1yRZCeBdEbxltdjuOeClKujczN3mCvRbV+vtHDyVQLheyCYUy6Z+A5CMq2hCcTXc+YfVHU0tN+/63sqYMgd8HbF7GzSk3T5xrVeSd+hGwYcvdDqjToZMEXjdmzz2t7X7Qek6rfbrPrcKwrvQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62fc667-9fc5-4881-dacf-08d7a0157063
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 15:03:43.5584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kecMsuK5Gho4zUfofrD2/DnpGwduF99eXEOrAycMAk9ucJrbQaX4iDc62sNJS/7kh+ZheTOt91C6l37RUSfkWKyy1vzwD06B7AKZfAoieU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2103
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 15 January 2020 16:23, Marco Felsch wrote:

> The restart handler is executed during the shutdown phase which is
> atomic/irq-less. The i2c framework supports atomic transfers since
> commit 63b96983a5dd ("i2c: core: introduce callbacks for atomic
> transfers") to address this use case. Using regmap within an atomic
> context is allowed only if the regmap type is MMIO and the cache type
> 'flat' or no cache is used. Using the i2c_smbus_write_byte_data()
> function can be done without additional tests because:
>  1) the DA9062 is an i2c-only device and
>  2) the i2c framework emulates the smbus protocol if the host adapter
>     does not support smbus_xfer by using the master_xfer.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> Hi,
>=20
> This patch is based on Stefan Lengfeld's RFC Patch [1].
>=20
> [1] https://patchwork.ozlabs.org/patch/1085942/
>=20
> Changes:
>=20
> v2:
> - adapt commit message
> - add comment
> - make use of i2c_smbus_write_byte_data()
> ---
>  drivers/watchdog/da9062_wdt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index c9b9d6394525..77b6b5336067 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/i2c.h>
>  #include <linux/delay.h>
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
> @@ -149,12 +150,13 @@ static int da9062_wdt_restart(struct watchdog_devic=
e
> *wdd, unsigned long action,
>  			      void *data)
>  {
>  	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
> +	struct i2c_client *client =3D to_i2c_client(wdt->hw->dev);
>  	int ret;
>=20
> -	ret =3D regmap_write(wdt->hw->regmap,
> -			   DA9062AA_CONTROL_F,
> -			   DA9062AA_SHUTDOWN_MASK);
> -	if (ret)
> +	/* Don't use regmap because it is not atomic safe */
> +	ret =3D i2c_smbus_write_byte_data(client, DA9062AA_CONTROL_F,
> +					DA9062AA_SHUTDOWN_MASK);
> +	if (ret < 0)
>  		dev_alert(wdt->hw->dev, "Failed to shutdown (err =3D %d)\n",
>  			  ret);
>=20
> --
> 2.20.1

