Return-Path: <linux-watchdog+bounces-500-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3183D7DF
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jan 2024 11:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4929529A12D
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jan 2024 10:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319D45732D;
	Fri, 26 Jan 2024 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CDdWmVc3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49021B599
	for <linux-watchdog@vger.kernel.org>; Fri, 26 Jan 2024 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263052; cv=none; b=hfjEZSZ/ulVxc4xaZ33UC+MW8O5M+p+NgvGvKYNrUr9dg46omqUDq2LUhXAhN12Y8Ld39SGA/BkWVTU7t0hiYypiVzbJa03w9MTZ5QiNogijx7eueTnMtQMMZ0gDSQgF9l47NUvLgh4FnbtMZ+nu1xZcaeEURJzpMqHV/UY9CsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263052; c=relaxed/simple;
	bh=PFKESGwT+52VOtSt0GyKDZV9D4/icQHM8Qc6/fiJ5to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IR/k+rfgNdd+q8rOvDxdnw8R9ZWen9Q+8xIXTBBnF1irOwX9Vr47QvdXOEvjx7eJFWktsti5Bg7ZlC+aXXO1qanw/N1IxhakG3y7vrXQSo4Dh460lYUHeuPsF2UKyfq8SxpfL039KyWjuOgk0sQjyH8dP0mISlwlM9TwlBW7iRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CDdWmVc3; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51021b25396so221437e87.3
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jan 2024 01:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706263048; x=1706867848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=CDdWmVc3Hfb/YBas1kYEA9dyfERmQKbMoVyy7sORYJgWuc6XqnRdcN0iJZFMC+gX7F
         iml8gPRRdKzNC/C3IXBLjr5uZJh0RKnH8NA4F58tiK0XHRoA+JkS5/uoe6Q06JY5qe0W
         3Vu+luYxqwBRYyqPfiqDw0gIqOcbVg6QDp9t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263048; x=1706867848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8Jw334gbtlpfyMf//A4Kl+X5QTyArqRPZ+OYE2aYXw=;
        b=VPd6HHGvExXH5SnBCKQDZsmGb/oBps2GSnjJ1KZgEtz2EVBft7K1HCXUWF8dtrvhrd
         TQrrJ+Wbg1PYM1YIJdgJSKCDedNX3Kqdf5GxiUH8oJnh5CFiwfkx9hqLD9JJlg7wOhxk
         jQAkaPqqOfh/W/r6dGSUQQa6nzk4azt7HPQubEuCQKxNvkU13+Ct09A73MpuShmhYC99
         L+mnZMhzuCwmR5z/Xm32TfP6aBt+A/kzUhDMHmFBmF7dWyqR33U7tyolk3LUUz5bwAvc
         4v4zaVJnUA1bAIi0LYfjUaWkSQ7wHk+iiI1EEZ+r+W1s4VcUYawOZYmZid+BTDqNs1q+
         JXzg==
X-Gm-Message-State: AOJu0YzmAkEjGDkyQHmUVi49g5VZ0sJI406XCJ6twKwxrHWpmlaLY4FL
	RJ4TJqVgIA1ztJHh8EQ/YSbUvYm+i4eVIwOPYe/iICgyyH5S+n6at2GXxWqTDw==
X-Google-Smtp-Source: AGHT+IG/Mwiteol2JuMT9UYjIHvJwx07Sd3BR0ZabMyBJWb6CZtR3UbTL5paq6F+L/BF5pNy5JAyhA==
X-Received: by 2002:a05:6512:36cd:b0:510:25be:d7b5 with SMTP id e13-20020a05651236cd00b0051025bed7b5mr218218lfs.9.1706263047725;
        Fri, 26 Jan 2024 01:57:27 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b0050ecae41c51sm129041lfs.135.2024.01.26.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:57:26 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Lukasz Majczak <lma@chromium.org>
Subject: [PATCH v4 1/3] platform/chrome: Update binary interface for EC-based watchdog
Date: Fri, 26 Jan 2024 09:57:19 +0000
Message-ID: <20240126095721.782782-2-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126095721.782782-1-lma@chromium.org>
References: <20240126095721.782782-1-lma@chromium.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update structures and defines related to EC_CMD_HANG_DETECT
to allow usage of new EC-based watchdog.

Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 78 +++++++++----------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 7dae17b62a4d..ecc47d5fe239 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3961,60 +3961,52 @@ struct ec_response_i2c_passthru {
 } __ec_align1;
 
 /*****************************************************************************/
-/* Power button hang detect */
-
+/* AP hang detect */
 #define EC_CMD_HANG_DETECT 0x009F
 
-/* Reasons to start hang detection timer */
-/* Power button pressed */
-#define EC_HANG_START_ON_POWER_PRESS  BIT(0)
-
-/* Lid closed */
-#define EC_HANG_START_ON_LID_CLOSE    BIT(1)
-
- /* Lid opened */
-#define EC_HANG_START_ON_LID_OPEN     BIT(2)
-
-/* Start of AP S3->S0 transition (booting or resuming from suspend) */
-#define EC_HANG_START_ON_RESUME       BIT(3)
-
-/* Reasons to cancel hang detection */
+#define EC_HANG_DETECT_MIN_TIMEOUT 5
+#define EC_HANG_DETECT_MAX_TIMEOUT 65535
 
-/* Power button released */
-#define EC_HANG_STOP_ON_POWER_RELEASE BIT(8)
+/* EC hang detect commands */
+enum ec_hang_detect_cmds {
+	/* Reload AP hang detect timer. */
+	EC_HANG_DETECT_CMD_RELOAD = 0x0,
 
-/* Any host command from AP received */
-#define EC_HANG_STOP_ON_HOST_COMMAND  BIT(9)
+	/* Stop AP hang detect timer. */
+	EC_HANG_DETECT_CMD_CANCEL = 0x1,
 
-/* Stop on end of AP S0->S3 transition (suspending or shutting down) */
-#define EC_HANG_STOP_ON_SUSPEND       BIT(10)
+	/* Configure watchdog with given reboot timeout and
+	 * cancel currently running AP hang detect timer.
+	 */
+	EC_HANG_DETECT_CMD_SET_TIMEOUT = 0x2,
 
-/*
- * If this flag is set, all the other fields are ignored, and the hang detect
- * timer is started.  This provides the AP a way to start the hang timer
- * without reconfiguring any of the other hang detect settings.  Note that
- * you must previously have configured the timeouts.
- */
-#define EC_HANG_START_NOW             BIT(30)
+	/* Get last hang status - whether the AP boot was clear or not */
+	EC_HANG_DETECT_CMD_GET_STATUS = 0x3,
 
-/*
- * If this flag is set, all the other fields are ignored (including
- * EC_HANG_START_NOW).  This provides the AP a way to stop the hang timer
- * without reconfiguring any of the other hang detect settings.
- */
-#define EC_HANG_STOP_NOW              BIT(31)
+	/* Clear last hang status. Called when AP is rebooting/shutting down
+	 * gracefully.
+	 */
+	EC_HANG_DETECT_CMD_CLEAR_STATUS = 0x4
+};
 
 struct ec_params_hang_detect {
-	/* Flags; see EC_HANG_* */
-	uint32_t flags;
-
-	/* Timeout in msec before generating host event, if enabled */
-	uint16_t host_event_timeout_msec;
+	uint16_t command; /* enum ec_hang_detect_cmds */
+	/* Timeout in seconds before generating reboot */
+	uint16_t reboot_timeout_sec;
+} __ec_align2;
 
-	/* Timeout in msec before generating warm reboot, if enabled */
-	uint16_t warm_reboot_timeout_msec;
-} __ec_align4;
+/* Status codes that describe whether AP has boot normally or the hang has been
+ * detected and EC has reset AP
+ */
+enum ec_hang_detect_status {
+	EC_HANG_DETECT_AP_BOOT_NORMAL = 0x0,
+	EC_HANG_DETECT_AP_BOOT_EC_WDT = 0x1,
+	EC_HANG_DETECT_AP_BOOT_COUNT,
+};
 
+struct ec_response_hang_detect {
+	uint8_t status; /* enum ec_hang_detect_status */
+} __ec_align1;
 /*****************************************************************************/
 /* Commands for battery charging */
 
-- 
2.43.0.429.g432eaa2c6b-goog


