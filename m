Return-Path: <linux-watchdog+bounces-255-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DEA80D2B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 17:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1497C2817C8
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 16:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163CC487A8;
	Mon, 11 Dec 2023 16:47:36 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C0F98;
	Mon, 11 Dec 2023 08:47:29 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0FE9F7FD3;
	Tue, 12 Dec 2023 00:47:26 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 00:47:26 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 00:47:20 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: <krzysztof.kozlowski@linaro.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<jisheng.teoh@starfivetech.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<leyfoon.tan@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<samin.guo@starfivetech.com>, <wim@linux-watchdog.org>,
	<xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v1 1/2] watchdog: starfive-wdt: Add JH8100 watchdog compatible string
Date: Tue, 12 Dec 2023 00:47:00 +0800
Message-ID: <20231211164700.1590908-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <84145eba-7877-4dc0-a221-2debb5a40d40@linaro.org>
References: <84145eba-7877-4dc0-a221-2debb5a40d40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Dec 2023 11:06:42 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 09/12/2023 15:27, Ji Sheng Teoh wrote:
> > Add "starfive,jh8100-wdt" compatible for StarFive's JH8100 watchdog.
> > JH8100 watchdog reuses JH7110 register mapping.
> >=20
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> > ---
> >  drivers/watchdog/starfive-wdt.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/watchdog/starfive-wdt.c
> > b/drivers/watchdog/starfive-wdt.c index 5f501b41faf9..31785bb373d5
> > 100644 --- a/drivers/watchdog/starfive-wdt.c
> > +++ b/drivers/watchdog/starfive-wdt.c
> > @@ -581,6 +581,7 @@ static const struct dev_pm_ops
> > starfive_wdt_pm_ops =3D { static const struct of_device_id
> > starfive_wdt_match[] =3D { { .compatible =3D "starfive,jh7100-wdt",
> > .data =3D &starfive_wdt_jh7100_variant }, { .compatible =3D
> > "starfive,jh7110-wdt", .data =3D &starfive_wdt_jh7110_variant },
> > +	{ .compatible =3D "starfive,jh8100-wdt", .data =3D
> > &starfive_wdt_jh7110_variant }, =20
>=20
> Device is compatible, so why not expressing it in the bindings and
> dropping this change?
>=20
> Best regards,
> Krzysztof
>=20

Ok, will drop this change.

Thanks,
Ji Sheng

