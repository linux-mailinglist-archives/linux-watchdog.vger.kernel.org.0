Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94C69321B20
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 16:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhBVPRB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 10:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhBVPPX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 10:15:23 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33AEC061A32;
        Mon, 22 Feb 2021 07:13:07 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id v1so19443422wrd.6;
        Mon, 22 Feb 2021 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=24BL/iNm/fhU40HUi/hWtrmxaezcBQ+HXPsyjGQxBIo=;
        b=aaT0G/6TPkMVKasY0K+CD2HHIphx92WqXSKR482UnNPC/Dw6RTdYUajXcvWj5JxCpW
         8sfT+13XlreR72oYWOKLWRxOzgMLwot2q8GXpJiWoq7vv8keyNgyGAEXQdIAJZsYFYxu
         9oozI3VPNhjir/Dc8xRVF1efGRLRax2AL5U3xKZd7hI8ahM6/+EAqOeu+v5ExNEfvU6m
         YEXviYbfZtFcujSnXKa1vV3/Q31O/Ry8WfSmofK190AjXtfW9k71QJWUCY5NINQpW957
         9mMzgZFjNzNAd7tyXyKdIA1tfAyIwnDAVCOtXKEkuIkii8yw8fvQhbc2VIO2C2wFJoeR
         51Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=24BL/iNm/fhU40HUi/hWtrmxaezcBQ+HXPsyjGQxBIo=;
        b=mxSpTBxTu2odHRPXz3dO/N5Jxal2uKE+spaAxZY1g2TA5MBbEE72gAtgHnxE7duj8v
         tRXiG6+A0nqxwsq0Us5SPDHwA92GGyFHnLX/JUdJvffJKu+pmJ9O9QlCod17g7ufoz0Y
         dG4G/2nbYKr3yUPuuCSnZZ50UFBo2zsM4uk9KdrvYUeq+iWjFEUwINtaIurXUGTq/G5e
         ofEasL3kFZT3mxyoKZvuq6oUOKkDvFF1hujbMr/aWQu5pCWe4fZa6i5BvyHdCGv0fJ7k
         x1Mr40ljK9YyhYoPQEYBnpzHix13FOFuGNuNnkCrdEeZg8FnCnbZ0oQZH6gTZuvWr4T6
         M+lA==
X-Gm-Message-State: AOAM530NRopw+5KQgzZN3G9z+Uly/VphpyGyqse/j4mFb0YXMdBcdtIQ
        4m1dVS2jmKSaRiOgNt1xjmUrVOeLUC0JOoOx7uw=
X-Google-Smtp-Source: ABdhPJxvgxyutQqdF4CzBQ2jUcCdCfMoxXN6O3eh4JjIrCfH4tryUG8CD/8iT/uMuDIoz+kC7pzRqA==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr21327841wrv.319.1614006786274;
        Mon, 22 Feb 2021 07:13:06 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id o13sm32313430wro.15.2021.02.22.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:13:05 -0800 (PST)
From:   Romain Perier <romain.perier@gmail.com>
To:     Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Romain Perier <romain.perier@gmail.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/20] s390/watchdog: Manual replacement of the deprecated strlcpy() with return values
Date:   Mon, 22 Feb 2021 16:12:31 +0100
Message-Id: <20210222151231.22572-21-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222151231.22572-1-romain.perier@gmail.com>
References: <20210222151231.22572-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The strlcpy() reads the entire source buffer first, it is dangerous if
the source buffer lenght is unbounded or possibility non NULL-terminated.
It can lead to linear read overflows, crashes, etc...

As recommended in the deprecated interfaces [1], it should be replaced
by strscpy.

This commit replaces all calls to strlcpy that handle the return values
by the corresponding strscpy calls with new handling of the return
values (as it is quite different between the two functions).

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 drivers/watchdog/diag288_wdt.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index aafc8d98bf9f..5703f35dd0b7 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -111,7 +111,7 @@ static unsigned long wdt_status;
 static int wdt_start(struct watchdog_device *dev)
 {
 	char *ebc_cmd;
-	size_t len;
+	ssize_t len;
 	int ret;
 	unsigned int func;
 
@@ -126,7 +126,9 @@ static int wdt_start(struct watchdog_device *dev)
 			clear_bit(DIAG_WDOG_BUSY, &wdt_status);
 			return -ENOMEM;
 		}
-		len = strlcpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
+		len = strscpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
+		if (len == -E2BIG)
+			return -E2BIG;
 		ASCEBC(ebc_cmd, MAX_CMDLEN);
 		EBC_TOUPPER(ebc_cmd, MAX_CMDLEN);
 
@@ -163,7 +165,7 @@ static int wdt_stop(struct watchdog_device *dev)
 static int wdt_ping(struct watchdog_device *dev)
 {
 	char *ebc_cmd;
-	size_t len;
+	ssize_t len;
 	int ret;
 	unsigned int func;
 
@@ -173,7 +175,9 @@ static int wdt_ping(struct watchdog_device *dev)
 		ebc_cmd = kmalloc(MAX_CMDLEN, GFP_KERNEL);
 		if (!ebc_cmd)
 			return -ENOMEM;
-		len = strlcpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
+		len = strscpy(ebc_cmd, wdt_cmd, MAX_CMDLEN);
+		if (len == -E2BIG)
+			return -E2BIG;
 		ASCEBC(ebc_cmd, MAX_CMDLEN);
 		EBC_TOUPPER(ebc_cmd, MAX_CMDLEN);
 

