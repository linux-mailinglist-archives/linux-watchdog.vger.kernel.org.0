Return-Path: <linux-watchdog+bounces-4819-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B680ED2312F
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 09:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1D8300C2BE
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Jan 2026 08:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBFC324B1B;
	Thu, 15 Jan 2026 08:18:19 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFE30F924;
	Thu, 15 Jan 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465099; cv=none; b=pqO+w5138GbsXOjKx8JY37D19NIt0kW5KmHxtq0fBAWNx3BRSM3r9/4JEK9ERwPmsQcL+UUfNNNUQraNiWllx0QceaRwh+fm+xgyPl4ALlveWVZzctPLt16HZ0YlbAgdlj2asLLrRTHPMbwwOtw0kqpyuHmFpXLqUzsqm8MtEDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465099; c=relaxed/simple;
	bh=N0wFbXydq7vOdxwnTrUXHL3SEarqIdXmD9lvrxzhs9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkXZejk9LfeHejI65ZW6cIdB5qbn72PDQZ9KrFz+fc4JcVBxcg20RjFbdoJCDmOZSeqvMxWqOpBoHu19+/Es1Rm1cNAY2tYNfjCUjqZEsTnfnouphO9csJuZwsjIYpW8zORH3p8bH0Wny+S/bhVReJGhbiWMAPx37nuZ/rh7dEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 60F8Ffqm082945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 Jan 2026 16:15:41 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 16:15:41 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH V2 3/3] MAINTAINERS: Add entry for Andes ATCWDT200
Date: Thu, 15 Jan 2026 16:14:44 +0800
Message-ID: <20260115081444.2452357-4-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115081444.2452357-1-cl634@andestech.com>
References: <20260115081444.2452357-1-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60F8Ffqm082945

Add a MAINTAINERS entry for the Andes ATCWDT200 watchdog driver and its
associated Device Tree bindings.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 12f49de7fe03..1a1c2b68252a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1817,6 +1817,12 @@ S:	Supported
 F:	drivers/clk/analogbits/*
 F:	include/linux/clk/analogbits*
 
+ANDES ATCWDT200 WATCHDOG DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/watchdog/andestech,ae350-wdt.yaml
+F:	drivers/watchdog/atcwdt200_wdt.c
+
 ANDROID DRIVERS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Arve Hjønnevåg <arve@android.com>
-- 
2.34.1


