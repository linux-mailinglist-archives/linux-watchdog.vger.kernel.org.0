Return-Path: <linux-watchdog+bounces-175-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E680B4E2
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 15:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D3A2810B7
	for <lists+linux-watchdog@lfdr.de>; Sat,  9 Dec 2023 14:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84F748C;
	Sat,  9 Dec 2023 14:28:07 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1B210E0;
	Sat,  9 Dec 2023 06:28:01 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 13BC824DFCE;
	Sat,  9 Dec 2023 22:27:59 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 22:27:58 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 9 Dec
 2023 22:27:53 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] watchdog: starfive-wdt: Add JH8100 watchdog compatible string
Date: Sat, 9 Dec 2023 22:27:22 +0800
Message-ID: <20231209142723.2060196-2-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209142723.2060196-1-jisheng.teoh@starfivetech.com>
References: <20231209142723.2060196-1-jisheng.teoh@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Add "starfive,jh8100-wdt" compatible for StarFive's JH8100 watchdog.
JH8100 watchdog reuses JH7110 register mapping.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 drivers/watchdog/starfive-wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-=
wdt.c
index 5f501b41faf9..31785bb373d5 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -581,6 +581,7 @@ static const struct dev_pm_ops starfive_wdt_pm_ops =3D=
 {
 static const struct of_device_id starfive_wdt_match[] =3D {
 	{ .compatible =3D "starfive,jh7100-wdt", .data =3D &starfive_wdt_jh7100=
_variant },
 	{ .compatible =3D "starfive,jh7110-wdt", .data =3D &starfive_wdt_jh7110=
_variant },
+	{ .compatible =3D "starfive,jh8100-wdt", .data =3D &starfive_wdt_jh7110=
_variant },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, starfive_wdt_match);
--=20
2.25.1


