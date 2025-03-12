Return-Path: <linux-watchdog+bounces-3089-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0CA5E0D5
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 16:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E66A7A7F77
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 15:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FFE253F31;
	Wed, 12 Mar 2025 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="EFjXtP9z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D623C8C9
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Mar 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794371; cv=none; b=BAvEIlMp4XY1VgSiiVm/N7EzL27BsaBF4kQQM0bSYjbofvF6LpDtkTD5Q4OIt+fuV3bFMwJA9LYEFxYzMvwCGuTcm28lmc8z7Y1y8iT4gTz3rqbtTMbKoMhaS0CWLX2wRgi8lUCqszxCPzabu8QRX9zWGH2X8EAvpU1wp1gBfLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794371; c=relaxed/simple;
	bh=RMhS2sjhh4e3IfmFUCYCZDan+fpWY2ntAaWVrW8ASgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQjkk1Xlfjm0YCzC+NUQA8wLpEBt00kTIgg8mPKfWBLO31ZpezFYYMjfnZw/EIsi6J8Ibqm2mwkJUNG4c4Qm5j00i1bUsVT02g8Uysm8Z88FQWo89oxQjNb/BFwnPWuOaGC/kqrBVfrOPfYWct9qGzGhnwXwSqch7MC75TM8NUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=EFjXtP9z; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025031215460783e192ef45f615744a
        for <linux-watchdog@vger.kernel.org>;
        Wed, 12 Mar 2025 16:46:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yZ0hqVu+qoqJ5gOLuAKvUAj9SEf7RKv4cE8IhbeX2lY=;
 b=EFjXtP9zjay7VVnBCX4yNfHUn1XPMi8FQ9DmV08LiwhH5GLmGcSEta9/OqWP9ZjZto1OBf
 5BxToPgsJ3C2/0M5F6TYbUclakNJR/U+JihDrVfHWZx4iXV6JQzZ+Id+9PjXjSzyvNtr04mI
 wvH0KA8RXs0PeOH3ZGlGruuxh62yzaZon/Ic+r21dzlDum0xW0Ym0TLrbAcwzkp1NGsMQwZL
 aRLnGK2ajG8PuusYQ+fyR6trigTdAKgt2Zy3ozHzL0LWXCGs3jA+bNiZvC9wjy61jsNnZnoA
 ZUhLgu7MR+w2jKWfb6ozLh+MC9gmYsk7XCdQ8pxNoGoYspSe4nczm3sA==;
From: Diogo Ivo <diogo.ivo@siemens.com>
Date: Wed, 12 Mar 2025 15:46:02 +0000
Subject: [PATCH v2 2/2] ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP
 device list
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-ivo-intel_oc_wdt-v2-2-52d09738cd0b@siemens.com>
References: <20250312-ivo-intel_oc_wdt-v2-0-52d09738cd0b@siemens.com>
In-Reply-To: <20250312-ivo-intel_oc_wdt-v2-0-52d09738cd0b@siemens.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, jan.kiszka@siemens.com, 
 benedikt.niedermayr@siemens.com, Diogo Ivo <diogo.ivo@siemens.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741794365; l=849;
 i=diogo.ivo@siemens.com; s=20240529; h=from:subject:message-id;
 bh=RMhS2sjhh4e3IfmFUCYCZDan+fpWY2ntAaWVrW8ASgo=;
 b=qLdDiUab6U7IFBbaPKeHTrO0ZnvzKxoH3mtzUlzkY2hpOs9P8vR4w1WhLufP/epXk7nUwGP+k
 0e2M22UIHDPB2vA0f6OjTzddVQ7VPNtXJVDUJ+zRydhTjx5JWzrSYw/
X-Developer-Key: i=diogo.ivo@siemens.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

With the kernel having an ACPI driver for these watchdog devices add
their IDs to the known non-PNP device list. Note that this commit is
not a complete list of all the possible watchdog IDs.

Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
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


