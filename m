Return-Path: <linux-watchdog+bounces-3117-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F260A64B1D
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Mar 2025 11:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 837F5188B0D9
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Mar 2025 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EE12356DD;
	Mon, 17 Mar 2025 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="JI/6N8x4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E6233717
	for <linux-watchdog@vger.kernel.org>; Mon, 17 Mar 2025 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208927; cv=none; b=F1wyxQvhEZb/jEeVI9NMTuuCpF3NHTmJX7iy1/f6N4ZPRbYMWL9J07BYaVWDu1qzNZePoZyOS3+Su3xyQxacNQ9P8DLMNNRQyHjIT3zxhb/gx23nr/LM+5DpbEeCklZFfrxIvlbRhVomx/y/Cbf4ksIrS9S1RPzBe+WDxg9uKU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208927; c=relaxed/simple;
	bh=GwZkwEPq4cFO76H7Y98P0dYu+xTlZLKLmJbqtXxtgoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRk5lk0ymqWTicD81Mn9xXHOeGwF4+BFJeKTQjyM4z8yr4Apx+L3mD1FU23F2zfg9pxKhYQ0muJQ4Tc085JW+dcQdgeYkDmY1Ws6DLHonfrXt4YefiuyU2QEgEe6tcaxyNiwsTTyJw0Fk4AZe443FbASY6sL1VIvDZmntNO9dfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=JI/6N8x4; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025031710551610bff1c5a719cbf8f7
        for <linux-watchdog@vger.kernel.org>;
        Mon, 17 Mar 2025 11:55:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=y+mw3eTX34ZhavSHte3oJKReRA6UkQ9FchpympJdBDU=;
 b=JI/6N8x4mVjbr45hoavaLf/aGefRfdWxattg46X3Dgi2YoJwOiU7qtwyX+PDRFDJGSvmJS
 oNhMnWUbaAFifbwveZqS8Q58YJDx8eASUrPkzRf4NqC7B7GEH3Sk77XNkvLJ2091pK859sPJ
 SOBBYDlT+AHZjZEWpeM5+L01Q/eeRQ6CIif1OXBty95ZfIN7ZniIK4twi4R53VtuQsBXx0q8
 qPUpk81klcLeXON8sJ2oqrPgAoB48oxzC+5iABsjiGsqmc1wXOkVAj2LItFibFyLLi8Oa/4b
 VaPie81M8C5mlCk48z6s8MMI7LF9/bdQzEFXxW7QHSU3TKHL0eJNZ2DQ==;
From: Diogo Ivo <diogo.ivo@siemens.com>
Date: Mon, 17 Mar 2025 10:55:07 +0000
Subject: [PATCH v3 2/2] ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP
 device list
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-ivo-intel_oc_wdt-v3-2-32c396f4eefd@siemens.com>
References: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
In-Reply-To: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, jan.kiszka@siemens.com, 
 benedikt.niedermayr@siemens.com, Diogo Ivo <diogo.ivo@siemens.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742208915; l=1282;
 i=diogo.ivo@siemens.com; s=20240529; h=from:subject:message-id;
 bh=GwZkwEPq4cFO76H7Y98P0dYu+xTlZLKLmJbqtXxtgoY=;
 b=6W9q+5XD/i/wOmfmYYsERYU3EDKkvbACjgaHLOvYW415Tn+DZKc/jwF11nhb5qU641xyfV2NK
 DT/iPamQrcNBFjD2X1vM0AZpPQsQ569/PQ+TDiJXO8jY/GeJqhRlUT6
X-Developer-Key: i=diogo.ivo@siemens.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

Intel Over-Clocking Watchdogs are described in ACPI tables by both the
generic PNP0C02 _CID and their ACPI _HID. The presence of the _CID then
causes the PNP scan handler to attach to the watchdog, preventing the
actual watchdog driver from binding. Address this by adding the ACPI
_HIDs to the list of non-PNP devices, so that the PNP scan handler is
bypassed.

Note that these watchdogs can be described by multiple _HIDs for what
seems to be identical hardware. This commit is not a complete list of
all the possible watchdog ACPI _HIDs.

Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
---
v2->v3:
 - Reword the commit message to clarify purpose of patch
---
---
 drivers/acpi/acpi_pnp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
index 01abf26764b00c86f938dea2ed138424f041f880..3f5a1840f573303c71f5d579e32963a5b29d2587 100644
--- a/drivers/acpi/acpi_pnp.c
+++ b/drivers/acpi/acpi_pnp.c
@@ -355,8 +355,10 @@ static bool acpi_pnp_match(const char *idstr, const struct acpi_device_id **matc
  * device represented by it.
  */
 static const struct acpi_device_id acpi_nonpnp_device_ids[] = {
+	{"INT3F0D"},
 	{"INTC1080"},
 	{"INTC1081"},
+	{"INTC1099"},
 	{""},
 };
 

-- 
2.48.1


