Return-Path: <linux-watchdog+bounces-336-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35E8125EC
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 04:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F921C20D6B
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Dec 2023 03:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD6B17D4;
	Thu, 14 Dec 2023 03:31:57 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E02DB0;
	Wed, 13 Dec 2023 19:31:52 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 46AC27F98;
	Thu, 14 Dec 2023 11:31:50 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 11:31:49 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 14 Dec
 2023 11:31:44 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] Add StarFive JH8100 watchdog
Date: Thu, 14 Dec 2023 11:30:55 +0800
Message-ID: <20231214033056.3953143-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

Changes since v2:
- Express JH8100 compatibility to JH7110 in dt-bindings.
- Rework min/maxItems constraint for JH8100 resets property.

Changes since v1:
- Drop "starfive,jh8100-wdt" compatible field in starfive-wdt.c,
  and express them in dt-bindings.
- Use minItems in resets field to cater for single reset signal
  in JH8100.
- Reword Watchdog reset to Core reset for JH8100.

StarFive's JH8100 watchdog reuses JH7100 register mapping.
DT-binding of JH7100 watchdog is extended to support JH8100.
Since JH8100 only uses 1 reset signal, update the binding to
support one reset for "starfive,jh8100-wdt" compatible.

Ji Sheng Teoh (1):
  dt-bindings: watchdog: starfive,jh7100-wdt: Add compatible for JH8100

 .../watchdog/starfive,jh7100-wdt.yaml         | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

--=20
2.25.1


