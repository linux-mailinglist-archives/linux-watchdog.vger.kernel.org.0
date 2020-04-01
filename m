Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05CEB19A96E
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Apr 2020 12:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgDAKUl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 Apr 2020 06:20:41 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.114]:46862 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727308AbgDAKUk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 Apr 2020 06:20:40 -0400
Received: from [100.113.5.83] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-central-1.aws.symcld.net id E1/42-35964-5FA648E5; Wed, 01 Apr 2020 10:20:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WScVCTdRjH+e19N16J1csY8cg5i6GWxNYwvL3
  aHZfXH60SDzn7h8R6N97YcBtz76hR2i2BjuAssFBCAdHN00KUeRHBYInEAafOQSBFJQh5IAep
  ZN1EZ3v3otV/n+/z/b7P73vvPQQmOS9KIBi7jbGaaaNcFIXrn485rbiTX7JDVb+PoIbaD4uo0
  eauSGqq8YKAGm9vFFCTM0HsJaHmZFOTUBMcy9B897cjUrPgXpmJZwsNZm2B/W2h/pqrGrNcjr
  J3tqgdaI4oR1EEIl0YDDRcF/CiF4dFV7GQF2cRLO4LiDiBk30Y1BwcCcckZJUAOq7ux3jxC4J
  f20ZQOVpGiEgKPu8bD38iJVsRBCqrcU5gZCmCAee9cCqWfBM+7poQciwlt8ODg/cxntdBVfMp
  nGOcXAU1o1dCTBBiMgcujW3mxhLSAp6L9UJuvIxMh2+b8rkxImXw50dfh7dgZDz8PNUg4BhIE
  pweH8ZzHMxMBoV8noH+vaOIn6fAxStTS5wIfz1YXGIZDDZULHEGTJSdwXlOhvnvD4h4psBZUR
  puCaHGwe4iHo1wqHkdn1gDC7//uNRgBdS13I3kfgiQh3EYnL6FVSJV7X9a85wCRzpui3h+Do4
  3zmIci8kY6P9yCj+C8K8QpbUa8vQ2E20wKlJVKkVq6guKNMX6DUr6fYVWyRQqdIzZZqVDppJ+
  j1WyRSadMVdpZmxuFLqn3F34i21o6NQfym60nBDI48Qn3ijZIXlcW5BbpKdZ/VvWQiPDdqMVB
  CEH8XVDyIuxMnmM/R2DMXSVD20gouVS8VheyBazFtrEGvJ4awApiMqZuqOYBDcXmJmEeHF66H
  glJBfSF5ofrXh424NIlhArRhEREZJoC2M1GWz/92+geALJY8VZ3JZog9n26KUboRKCUIlhezF
  Xwkb/ayU4BIW6LRcwp2CjPq7XmN2RHbj/TE+iSH3u+O4fOp88ce3SaM2erImMc7tcOWq3wn8z
  Y9P+vczqY56stTnSpLLNe7oTNwqTZy2zQ8WdennpeffOjjv1var01+o2rO+3PNaW9IGfMM15X
  pXdtXmUx2TTw5SPCNSmxTizF26/7qVbVjK6si2fXNZ8WumH3DR1/7bM7f7dbH7gjK5vte+mex
  60+QVo4mVteUlc69afPqvUBN2veHdGUGzV1uLannlCq/F+8c1AzYdn53xPd6nx5opWh3TR++y
  aTOb00QOiovZVmlvLq6cdV9eW9/ijcNf4PbMh5WSS77en3h3Bh7EnvJsmVXKc1dOpyZiVpf8B
  ZPn5l1YEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-4.tower-246.messagelabs.com!1585736436!1095708!1
X-Originating-IP: [104.47.17.175]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19265 invoked from network); 1 Apr 2020 10:20:37 -0000
Received: from mail-vi1eur05lp2175.outbound.protection.outlook.com (HELO EUR05-VI1-obe.outbound.protection.outlook.com) (104.47.17.175)
  by server-4.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2020 10:20:37 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6CSgatRBrsxpVvS+BE9i0PPu0aNuZBZEAky9WqriEjXCAkDtsnMlIyNv5sJ4blAQGZYrOpTceiHABNUV467yaywxXnZhNR/tGwb7IB6rZqmDwfep4CYFjheezG7i6m6zuM6dyel/VLRTlEC8GAityPKPPJ+kOuHrKeUKfiJf4jDVY0u69XcYnmCaojsZq97Ry+QSIRAQTW+wxJLlNFVAcOIs9uQWOCdgIvJIVGaNMAoi9bsuTRwQSJPtzbDjiSXSKWv8KXdRVYZBpCKk9QA8ZzIAx7cH4svamCDublJp4WWiuJ+UGqDoG1Y5J25zMOP4mh6ByytHY5KDyUZdgNpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5B2QaH1bzl/LWmC6KeB2TKq4+GQSuZPWpfxNSn5CJ4=;
 b=mOJIrF5iYFhuuDq4CPu/am8KOhtL/JdYNDpwMScRu5K+jPVZ8MHkChs+mnLBO5V98PsnKWC6c3QCn59kxZzJItRNm5F1d+J1BQfXLqMfvy+MaJVjDWPaMdTYBSUM8n/VlZ2xbSfa66NP81CQ/tn1+eoNqd6MSTHJ+pyKK2qrwEkF727Vb1j1VlnzYjPluwR88iRmTweHJBGbMlSxgvlg0Azhr8wDoDasiNIH7b9alklsYnQbqg3e8nkO7HCQnO2q6cWHBPHVO20PwHE/88RJe7EAzPFtVXf5UeK7wBZX84KVNt92zA1zVm0AzhBg7LtCp/872wGj59ahLeIvwQwKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5B2QaH1bzl/LWmC6KeB2TKq4+GQSuZPWpfxNSn5CJ4=;
 b=Q7xd8I9xANBynOvXKOAr9Wa2byQWAu0okYbWVEONSTSXM0UBSbbGDCjCmrh854c+JUYn2CaM+nvGJ0JsJXV/TB9NPiRoPV+rN1cRD18y9QMdKNpEx/mncfwbM7WSpyYfYKEn669XpqDA+WrYWPe4F+3M4hKYKxx1AeRNcBSP288=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2120.EURPRD10.PROD.OUTLOOK.COM (52.134.113.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 10:20:32 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 10:20:32 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] watchdog: da9062: No need to ping manually before
 setting timeout
Thread-Topic: [PATCH 3/3] watchdog: da9062: No need to ping manually before
 setting timeout
Thread-Index: AQHWA3+NbV06Uh/Df0mWcPQbot1CmahkF1Ag
Date:   Wed, 1 Apr 2020 10:20:32 +0000
Message-ID: <AM6PR10MB226301829B873FFEFE845FE180C90@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200326150203.371673-1-s.riedmueller@phytec.de>
 <20200326150203.371673-3-s.riedmueller@phytec.de>
In-Reply-To: <20200326150203.371673-3-s.riedmueller@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 399ec2d5-d0ba-41a1-b63a-08d7d6264f65
x-ms-traffictypediagnostic: AM6PR10MB2120:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2120183A9A5F17914E1B41FDA7C90@AM6PR10MB2120.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(64756008)(54906003)(33656002)(5660300002)(186003)(53546011)(6506007)(6636002)(71200400001)(9686003)(26005)(110136005)(55016002)(4326008)(66556008)(66946007)(86362001)(316002)(52536014)(478600001)(66446008)(76116006)(7696005)(66476007)(2906002)(8676002)(81166006)(8936002)(81156014)(55236004);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRDkVy4zOxhvI5mpGca/sVQypxAI6//eb5DQv29f1Cu2N7UCC5l6Z3MFqGvRLxDI0QmYABa2PO844t5xGjn1i3xJI/AmiuFVY5MddhH8G6owWH/64s0/lpRFqcqQdwL7bgZz/yjCuWWuzH44Vv83a/tBn86cG6EOxNdGcxNJEYB1kJbhkZMUUGKeLwqfeHxcQJwycTBK3f5a+GKnQdXILcuSzXK6Wu630ePHyHI4MEkSP9ZJ7otqMXeKqbpJ+yTXNmBLU9zimmmvjNcCqFNvQEw0fG8CALKechjhXBg6FRc1638sWfZ5VEXcuNCWxWP9sUu82pTfsoPy7RJw+UW+U1/ykMLjTu1kUHSCYtpkQXGn6ZJGqUIJQuatwBGxafNaA55uTVc2cNH77H5L9/cNNPL5W9EQhGdiv2AOr5jrOVUBXqyCFutEGtsY5EE2uNLW
x-ms-exchange-antispam-messagedata: aynqdGgbCnm8z8s1r3pOJi7KmilNoeF7OcrMYAMRlnhYhkF/ArRZ8SpdOvO9F/rqJD5w36E+e7LunnLXmfpCJSufh5ojdpZL8Qx0Lpqu3onWs1wM1W5ZNxwEEJqM8fQBov2m/mkM7+fFLMO+xjDVTw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399ec2d5-d0ba-41a1-b63a-08d7d6264f65
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 10:20:32.4582
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHEYk1ECfNN6HR/kfwPTV8ktzL+YoTUsd6a1p3ciLJM/O0dZdiPic2zxST18HhJfrkctLwFDKeFyV00z7JEr/FfYWnpcNVAD26xid7wkV68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2120
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26 March 2020 15:02, Stefan Riedmueller wrote:

> There is actually no need to ping the watchdog before disabling it
> during timeout change. Disabling the watchdog already takes care of
> resetting the counter.
>=20
> This fixes an issue during boot when the userspace watchdog handler takes
> over and the watchdog is already running. Opening the watchdog in this ca=
se
> leads to the first ping and directly after that without the required
> heartbeat delay a second ping issued by the set_timeout call. Due to the
> missing delay this resulted in a reset.
>=20
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Thanks for the update:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/watchdog/da9062_wdt.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index 6d81b1276b87..c5bd075c8b14 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -66,11 +66,6 @@ static int da9062_wdt_update_timeout_register(struct
> da9062_watchdog *wdt,
>  					      unsigned int regval)
>  {
>  	struct da9062 *chip =3D wdt->hw;
> -	int ret;
> -
> -	ret =3D da9062_reset_watchdog_timer(wdt);
> -	if (ret)
> -		return ret;
>=20
>  	regmap_update_bits(chip->regmap,
>  				  DA9062AA_CONTROL_D,
> --
> 2.23.0

