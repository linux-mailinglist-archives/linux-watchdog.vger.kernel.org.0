Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1DFF0743
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 21:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbfKEUvY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 15:51:24 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55832 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfKEUvY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 15:51:24 -0500
Received: by mail-wm1-f65.google.com with SMTP id m17so877305wmi.5
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Nov 2019 12:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86+b3nLS9bc8VDStO93HdimlizslTYlGrlQhHJTbrT4=;
        b=VsXcQfpstDMDBiO/7BvB/yl0oN780/GG/FJehxFtBv77wAHaYRFX8xW5lDSq2WHLlS
         8RF/ARYHZfN5KAqvNgA91kSpzufz7c/zI/5GhNR34FdUiNTmFDlOvRAxt/jEz7Xc18fQ
         F3+4wE6qJOQtYYHS6cz5on9mOT+NI+HGGhjDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86+b3nLS9bc8VDStO93HdimlizslTYlGrlQhHJTbrT4=;
        b=aCGTXIoZaxfkfzpOFtRWiVW0e7ZUli8b9lVnZ159oRGmpqkzZF0rAkDFM33zYi52OT
         gAnM3xzpS9bqcgE2iFicy162pYJokVSGmHmHrGwPwRAZpVNgn3jBY9GaLSG96nXIKB20
         VPY6ppG8ORXSNRaR82ud0Ge0hwF8cpcpc4YJsR3ptU4cVqxXHr8De7dciapuMvt8hj/A
         cjkU/WOkwk4UcT36W+htkEnfK45LswuLf4UudAQFJCDuRHzDWWLq4MCj/hYjBDIc4RmL
         MygHJe/M7U5+4OAjZPfppcUuQoL7UnmAXNY/XQReSPuV1bHZhpViCDlTFykpBH2rO17L
         rHKw==
X-Gm-Message-State: APjAAAV03qTNkGji2G3R61mDxJuCGghrZy0kjO9t+SDuTKlx/HlXeCjX
        hGMNK72MW1oDucblT5Cz9enaq7eQMO/C/g==
X-Google-Smtp-Source: APXvYqygaILxJIOrGAvvSOaxQJT6uuJyMfYoMplcREbHs8U18/qyRi5rEm0JQSsunlDySZ4b2tLKTQ==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr797441wmg.93.1572987082645;
        Tue, 05 Nov 2019 12:51:22 -0800 (PST)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id 4sm690226wmd.33.2019.11.05.12.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 12:51:21 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2] watchdog: make nowayout sysfs file writable
Date:   Tue,  5 Nov 2019 21:51:18 +0100
Message-Id: <20191105205118.11359-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
References: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

It can be useful to delay setting the nowayout feature for a watchdog
device. Moreover, not every driver (notably gpio_wdt) implements a
nowayout module parameter/otherwise respects CONFIG_WATCHDOG_NOWAYOUT,
and modifying those drivers carries a risk of causing a regression for
someone who has two watchdog devices, sets CONFIG_WATCHDOG_NOWAYOUT
and somehow relies on the gpio_wdt driver being ignorant of
that (i.e., allowing one to gracefully close a gpio_wdt but not the
other watchdog in the system).

So instead, simply make the nowayout sysfs file writable. Obviously,
setting nowayout is a one-way street.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
v2: drop redundant "current" variable and !!.

 .../ABI/testing/sysfs-class-watchdog          |  9 ++++++--
 drivers/watchdog/watchdog_dev.c               | 21 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
index 675f9b537661..9860a8b2ba75 100644
--- a/Documentation/ABI/testing/sysfs-class-watchdog
+++ b/Documentation/ABI/testing/sysfs-class-watchdog
@@ -17,8 +17,13 @@ What:		/sys/class/watchdog/watchdogn/nowayout
 Date:		August 2015
 Contact:	Wim Van Sebroeck <wim@iguana.be>
 Description:
-		It is a read only file. While reading, it gives '1' if that
-		device supports nowayout feature else, it gives '0'.
+		It is a read/write file. While reading, it gives '1'
+		if the device has the nowayout feature set, otherwise
+		it gives '0'. Writing a '1' to the file enables the
+		nowayout feature. Once set, the nowayout feature
+		cannot be disabled, so writing a '0' either has no
+		effect (if the feature was already disabled) or
+		results in a permission error.
 
 What:		/sys/class/watchdog/watchdogn/state
 Date:		August 2015
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index dbd2ad4c9294..d3bdcb144657 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -452,7 +452,26 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
 }
-static DEVICE_ATTR_RO(nowayout);
+
+static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret)
+		return ret;
+	if (value > 1)
+		return -EINVAL;
+	/* nowayout cannot be disabled once set */
+	if (test_bit(WDOG_NO_WAY_OUT, &wdd->status) && !value)
+		return -EPERM;
+	watchdog_set_nowayout(wdd, value);
+	return len;
+}
+static DEVICE_ATTR_RW(nowayout);
 
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
-- 
2.23.0

