Return-Path: <linux-watchdog+bounces-2656-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0209AA0192F
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jan 2025 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF8BB1627A5
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 Jan 2025 11:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9496136E3F;
	Sun,  5 Jan 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="dB8ldFG3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65EA6F06B
	for <linux-watchdog@vger.kernel.org>; Sun,  5 Jan 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075864; cv=none; b=AQtUEZC7A8nTTxk268tjfrfEMzI4A4nPxVG2JIRfiXI+kQmNo0Aj7FjauQO2Bkgnf7qnhUyLwaEWcS9YAgfUQ/gq3zyn25d5DfKIDjEXisVjTxMUTvGq6lRDpQu79GE1MdRpnRx+t66Ndvvabxrl2FW8aTCgQYVzUsDZI8wtLIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075864; c=relaxed/simple;
	bh=kKaybR1RXhSmGdDK+QUi/GgzhkBtdFiNW3ImKxlQc8g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TUBySrROllTWf7HuZ6HssBkUtBZN2kQtiOuiAYv0CEX4TTcQJac0nHHwNfly6JpH1VfGgQF9jE0eD851VWqpxKw4eIfv7far15W4Qz+ItksfljI9hUrLtrgsXF29hpsE747kXgM0WI/sHTBCFqeAGra7uDsWSPrQw/AQmQ385hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=dB8ldFG3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2167141dfa1so187787735ad.1
        for <linux-watchdog@vger.kernel.org>; Sun, 05 Jan 2025 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1736075862; x=1736680662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTYTzxhlu8wDW9q/pO5luiLqAn1aZv9s8HIRMHVb4/s=;
        b=dB8ldFG3KRb+FJo5uJBiNNN4B5lL2mxFxp8RmBaLFMGC+sIeqyeiy8FgNLUW6qWZvl
         /nHVTDLl/QtDuAr8FochW4bWPBA32I4MjY9bOMhEC1yKvDRT/vfKL/mhkA8LMh9XUL8P
         vMI78SfQ6ntTK+29MgfhRinD9U+AJdtWgJge7o1HcNiWIemMeOHVKtzVz8Y88/zWX/ER
         P25sN+3AixL2mds7gQZbpIlF0ScnGDEjBF1McvtcSPtlWcRtQ1F5eSHZCgU8/1ujEIVl
         gQOCewZGVcK0ZkG8CHG7shy4aWgZ3LrlnhmxsDJSaNYcxx0rwo1fSbKbpB+NcCY7NxQU
         99UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075862; x=1736680662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTYTzxhlu8wDW9q/pO5luiLqAn1aZv9s8HIRMHVb4/s=;
        b=sONi2/6mYA0UxRa0Gd+emWKFEhw2Wg7bcWKj0ba+hAkzb0gXP9LyolqUEeghztCBDF
         SG2Kv7sdmuKzaOAbNEkdS/SUZARNLQ0iJvy1cXiigd8gm/M3uB8MuLI2KUS6ra+piixA
         Hm95NjW/M4OMt8RXg0COeuSerto4hKnYSbDyPlW8/3cZnwQ+eaBLHoh4MF0FhtnvQzMo
         AP2nngX7igODFQc29oKNgYRLOcN5PWUQhKvEo4vSSPp4HN6vqGInrjxmFycOdp57nOMG
         TSG4IWJj2k8ktC1G2jfWOSfNwexECgfFbsnK5NXzQXHcUzSx06PHDTYr0CjMHhfhhUEz
         Vmbg==
X-Gm-Message-State: AOJu0YyccNpdC6BEKlPgidvxfuvPDgw0ccgHuND8HxDIg6r0T377qNzN
	SoyzAehHFEv0RH59zCVd8so3JlQGnIKnV0dL9K0X/zY03DwmTaDl7vrkl5tYJT4=
X-Gm-Gg: ASbGncswwHjkfb3VzAQZCu7o+aDiRJm/mcMhqTzQUgAVvXPAmw4y6mSqraXeICBaLkc
	tLjLqn7MsnrwMUtYVOA0OiNrZbOgXUmbyCvG1hGisI5IbgNvOBjBliO/7EzvbLZgBKBHYvXLySR
	6AAHONjv6Lgi9KmFDvRVXuk27OB9SMp7P0XW+qW9T3lVnnNoF46TCfoNFjfgoG7kcG5m+F+Th2j
	n33NipBkVPK4MZHk/nCL+0EmwyBzzglIdCLMtKSP2fTLXI4+/5s4WICmpeSx82WpEAzwpUJgyo+
	4wiWlhUUwzbDgD18GlnMpXTcmnnJS1vMnGPQnW03PQI=
X-Google-Smtp-Source: AGHT+IFVCWuVJcZdD7hhWbT65XKybHMpjSFa5WoOBglhzPQDITkDtzNEXuLjEgJg9ddRPwx4yJ5WbQ==
X-Received: by 2002:a17:903:41c8:b0:215:8847:4377 with SMTP id d9443c01a7336-219e6cf8584mr877183645ad.15.1736075862072;
        Sun, 05 Jan 2025 03:17:42 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d97casm272277415ad.138.2025.01.05.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 03:17:41 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] watchdog: rti_wdt: Fix an OF node leak in rti_wdt_probe()
Date: Sun,  5 Jan 2025 20:17:18 +0900
Message-Id: <20250105111718.4184192-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rti_wdt_probe() does not release the OF node reference obtained by
of_parse_phandle(). Add a of_node_put() call.

This was found by an experimental verification tool that I am
developing. Due to the lack of the actual device, no runtime test was
able to be performed.

Fixes: f20ca595ae23 ("watchdog:rit_wdt: Add support for WDIOF_CARDRESET")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/watchdog/rti_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index 58c9445c0f88..255ece133576 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -301,6 +301,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	node = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
 	if (node) {
 		ret = of_address_to_resource(node, 0, &res);
+		of_node_put(node);
 		if (ret) {
 			dev_err(dev, "No memory address assigned to the region.\n");
 			goto err_iomap;
-- 
2.34.1


