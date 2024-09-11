Return-Path: <linux-watchdog+bounces-1856-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA899753CE
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 15:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C30D1281848
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Sep 2024 13:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39F19F11D;
	Wed, 11 Sep 2024 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQqYXlL0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A419341A;
	Wed, 11 Sep 2024 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060846; cv=none; b=KL9kXI4JFWibxmSaNJruBJIBGEZl2mY+tPcoFX45EWE/5dlaP7wcj9sOyYXv9Ori5W2Oe5/lIAW+7a++qSCvEOpxlyZRKtemomNoCY4X/mswjjKP9ffvwXwQteohzJx1A2O+cEnc0MiDLgtJAI+H6LhpxMB+g0Mt5TrGQTJpOhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060846; c=relaxed/simple;
	bh=aTIvXlAhOchnA1LSzX3Lh6171UeL2VoQ+xFy/wcuwGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DYH+/VmW7tMP95UTUNekkXDUYoAWtU+ywTOj9JZAcoDiL7DI7f81RVLYyuJK7mYClp/vXZb5BqcshYcWZWU7s39WY8VqVg4l0oj8pcSIn3nQjzKxDczY2sv6NmnY2eIgUWJd865GN0Xcofa2CSNb6Ie503OCwK6L/lXHHHdQJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQqYXlL0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso2121915e9.2;
        Wed, 11 Sep 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726060843; x=1726665643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cv8t06vDvqWS56ZQgDh5smGqYcG8mSgVGYmge5+e74c=;
        b=bQqYXlL0/1RnVvtb29NkkY7eZDRY+eDbmZN25XY7fJ7GllPIotLgriFozX5Ky9Y6yE
         Rex5+lX0VaUCOj9jlErRwAEy6j5/kT4dkJhGA4HEm9+htNa08cfyvQ+dSv3R8atGYCCf
         fXNJFmrBvkSe4EwH9tS4ZZSJuhZitNpq35D0SuXLBQjsbcGoYlQ+p1ILtHrWtDuYMwfD
         +Y44JYGdKIJU2QpehFzv2XA+eud7pyeufB5w/CtcOh8yWapBJ3Hsa/wLwUeF3H9JZP/a
         fyjFZylSs3nCGF8LCRjmyzpxg1ihN7cnuPiKAgY/9UGcOETuTqG4A3v2YzteUK1Ig5hS
         NOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726060843; x=1726665643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cv8t06vDvqWS56ZQgDh5smGqYcG8mSgVGYmge5+e74c=;
        b=Z0nAfVu1fJ9akvqICu3Xn2u7YetFQi0qe83+Sc0NkeWLvXG6Vz4uEse6UCI14apyIh
         +do0pkdb8VByfiBLeu6uXp6WmmT8roJixTNJz8ACup3bUwy804OideartIFfEh2IwyvZ
         T7JIz3fFRbY8PgUoU6YzsCG1g22ORyHO4Bq30hXl3pq3b+XPPCYbg/Rykg9zR3eebtwM
         0CY9Sl3ZPO/nHYBG6ex1hZJhoLgnI5rExUAg81MueLFzHYzg9/JvgydM5V4wMt3lLedC
         aDIeQETs5Mojb6xtNuPVn30dK2xL6ZNpuiM07BsPmM16tKb1+ignlS5E6ELVPRvM4dph
         +RVw==
X-Forwarded-Encrypted: i=1; AJvYcCUGJIBG+lMBlGaytNg6JAiWVXywUK1pRZ5soh4ATGic9/7QiOfsdkxkFmmIdU6O+6+0ehmnbSMXiPLlnWEthqE=@vger.kernel.org, AJvYcCV/r7mlpkZ2XYz42u2zeTJe+DD2ALL4XrQ56JboJA8nuoS8SI3gckgmEMGJligbHxGyegjfaWIZisOITOpADl1FAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPM0QNj8mWVtrgHbzjxOl7/ZuyKzkdkJD3k5iJHamDhqQlNrjx
	ByEuwjsp3FNLQC5YKhaf1eWoYzJtLCmaTA/8pC94TfE8Ln2WhcUs
X-Google-Smtp-Source: AGHT+IEt9X9eG+LPA7JAVBfR+MGBEWWZR+hF+fGb/UCfwbLPnRHFF0k9T1EjLEC+oq/zMzPgwuN62A==
X-Received: by 2002:a05:600c:3508:b0:42c:bd4d:e8ab with SMTP id 5b1f17b1804b1-42cbd4ebf4cmr78485435e9.10.1726060842723;
        Wed, 11 Sep 2024 06:20:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d365fsm11597735f8f.82.2024.09.11.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 06:20:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] watchdog: rzv2h_wdt: Add missing MODULE_LICENSE tag to fix modpost error
Date: Wed, 11 Sep 2024 14:20:31 +0100
Message-Id: <20240911132031.544479-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the missing `MODULE_LICENSE()` tag to the `rzv2h_wdt` driver, which
resolves the following modpost error when built as a module:

    ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o

Fixes: f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Wim,

As `rzv2h_wdt.c` still not in -next maybe we can merge this patch in
original commit in the watchdog tree?

Cheers,
Prabhakar
---
 drivers/watchdog/rzv2h_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 2da7a631fb2a..1d1b17312747 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -270,3 +270,4 @@ static struct platform_driver rzv2h_wdt_driver = {
 module_platform_driver(rzv2h_wdt_driver);
 MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/V2H(P) WDT Watchdog Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


