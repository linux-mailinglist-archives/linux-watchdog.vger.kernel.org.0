Return-Path: <linux-watchdog+bounces-3325-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D6A948F5
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 21:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F6A3B3380
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Apr 2025 19:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD7B2144B4;
	Sun, 20 Apr 2025 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="0xX/eF37"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E3621128D
	for <linux-watchdog@vger.kernel.org>; Sun, 20 Apr 2025 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745175683; cv=none; b=o6WPGAA0UAFGL7wsY/BT3z3qBnaUimlL6q2J3YS7cZv0IAlcZhQ3OEtVh9gxkv4s6RWsbcrqbFZXc0jDlw8XQsl2E/q1Ys04NPzP2f6TzUJH6b4gKJjkxb9V0b54U9kjiBmeQWIZJvIeln4RkJrJtOJJ0g7yeuUvGURelHzs7tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745175683; c=relaxed/simple;
	bh=f31ZqoUi2cLrlBE6sOstnrARr8afP+5sSmKf/ykpvkU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qfOvNnUwF6Nwns90FCdO325HwfJijdJkYvhp/oOBftycyzy+yytAzWkXh2MZDnyfaW3a5NDxpqop/L4OwfjwB1z1xL67ftqn3cTxtvfM3SmyTHpt8Tg7qtBo8XFOuqWeN8KK12U2lkDOZIKcLX0vhS46k3nMJmGXY9T2hrd6hac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=0xX/eF37; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=0xX/eF37cMhK7cmWjEm/0Fjxpgl2dGrqC8Ncj0HoRIUsN9iF0ur+EWqMzvZTIcLM1ii7hrfnhW/pfq/+pN8JD4jx5czfL8OzmxfyATqK1Bz+nPdfgPF1gPwe4Q867tqhEX2E0J4NlgIqXx8fCsCpQbg7eDq+AmeTkpNzl9Q2xoIbwHUugo/6PVweGDHdEfcZ9tGVZxdhL3deHJfpoTXEb+iDIRFObh9kYr91Wsa0CVCwiGls6KQejlQ+G6DteurXmoLKrifNjhYnwKC/FLYuOJdw8pMPY5KHU5SY+a3wMf9O3sDExxIZKXOJzcnSpB2qqer1es0MCNQ4Q4fU4z94vQ==; s=purelymail3; d=purelymail.com; v=1; bh=f31ZqoUi2cLrlBE6sOstnrARr8afP+5sSmKf/ykpvkU=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-watchdog@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1640089901;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 20 Apr 2025 19:00:40 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] RESEND: watchdog: Exynos990 WDT enablement
Date: Sun, 20 Apr 2025 21:00:37 +0200
Message-Id: <20250420-wdt-resends-april-v1-0-f58639673959@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVEBWgC/x3MMQqAMAxA0atIZgO11IpeRRykjRqQKomoIN7d4
 viG/x9QEiaFrnhA6GTlLWVUZQFhGdNMyDEbrLG1cdbgFQ8UUkpRcdyFV2x81QRvnIu+hdztQhP
 f/7Mf3vcDFeigy2MAAAA=
X-Change-ID: 20250420-wdt-resends-april-7617c6044d69
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745175638; l=1062;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=f31ZqoUi2cLrlBE6sOstnrARr8afP+5sSmKf/ykpvkU=;
 b=aeMb1mip4EuNFqnut4/hMZguKoBKG/Zi7/f1mbPVfUPZVCbVdFvTE4znVX8+yT+f8d+8MRYBh
 DeRPJLpgeT8D/uu+14I3oXVub138Ah77Vj20pHmReqMqoGxPvVmOU8y
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v2:
- bindings: Fix cluster-index limiting
- Link to v1: https://lore.kernel.org/r/20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org

---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 11 +++---
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 45 insertions(+), 5 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250420-wdt-resends-april-7617c6044d69

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


