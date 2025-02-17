Return-Path: <linux-watchdog+bounces-2948-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB0A38BEB
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2025 20:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA50A7A18E7
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Feb 2025 19:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F62422DFBF;
	Mon, 17 Feb 2025 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="zLynZRs8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878E188587
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Feb 2025 19:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819178; cv=none; b=tNKC2G2/DxrnVRZmjDOzR5UkSPDCxOdqUuQQ1ZMbQplUwNW101d13HezRMjka9jCXlnKWE5Bb0JjYm2rd2vMsurdDDVvC6pezG+Qc+n3yiuX9CbYNaDmtRFZJtBjPJSXGD+iWJ16uJ1El4sZYMHiFwoFRZGw809/8Xj4qFXQKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819178; c=relaxed/simple;
	bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nDMac3yJ0BA/K74XC0Oi6FxNoTSuZ70MmyjmLxWxrVaYLboSWscW0rJMcYiUDIHXPojYCZqLffy9QdNof7EW5/JT1efMZrNkCg99DY2B6foPupDTFDslwaABZKlu6TQ9VggaB02FBLS6KDrwF8NiM5U7ROCi7I5DvwI9gBIrVtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=zLynZRs8; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=zLynZRs8Q49O7Lsgn2PdPf2DNKCgae1hip94DaxzczZGDo41KfW0zZnJ6usqsU14O7mywRgAYOTHYhcISxezMbCYsY+zd1eZDKQfOpSVRJsy5q6lGBB92CtG8x+v25FgYV86XCQ1RVW+RDQ2fFT9XjxeaH15UY0ZBhxPhNq4WZkCY1lr2HwEvywuqrWz5/GSlW99D/sXHzj98/LSmWP7Uly9wEODTmNIKkN8PuZuBQDk48f8QGnl/wDdBEKZEz+m/8nXAWqB9k0rakpM5v93iw/Y/pX2+tMA6QzwZZkDVwC4AfiWZ8ln1Dim3lTeLt5UWXbaMYiOQO3Ih9f804QXjw==; s=purelymail3; d=purelymail.com; v=1; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-watchdog@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1350358103;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:05:51 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] watchdog: Exynos990 WDT enablement
Date: Mon, 17 Feb 2025 20:05:18 +0100
Message-Id: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6Is2cC/x3MPQqAMAxA4atIZgtpoUi8ijiITTVLlUb8QXp3i
 +M3vPeCchZW6JsXMp+isqUK2zYwr1Na2EioBofOo7Od4ftJmxKhucJhkMki8uwjEdRmzxzl/n/
 DWMoHR/wo9l8AAAA=
X-Change-ID: 20250217-exynos990-wdt-0e9100ec5f99
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739819149; l=885;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=3ay3/NpwCM4uEJeiShAcGmbiyZhukhe5T732PsCDCKY=;
 b=yLF3P0Avq7SlNcQxFp+m8USAXVOXTw9vvfL4PZpeHmmhG37wVGZnjHZFzYwZJ0VEyIKLKLs9v
 HNrcGtLa/GhB/i6Q1QS0ZZhpgCm1lio1+Zr093rk8cWjCMqHS4OHyG6
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Hi all!
This series enables the two clusters of the Exynos990 watchdog timer
to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
the cl0 cluster and then jumps over to cl2. As such, new cluster index
code has been added to accomodate this oddity.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  9 +++--
 drivers/watchdog/s3c2410_wdt.c                     | 39 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
change-id: 20250217-exynos990-wdt-0e9100ec5f99

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


