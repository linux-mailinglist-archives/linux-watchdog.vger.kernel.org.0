Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9023CEFD25
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 13:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387833AbfKEMbb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 07:31:31 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38061 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbfKEMbb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 07:31:31 -0500
Received: by mail-lf1-f68.google.com with SMTP id q28so15013502lfa.5
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Nov 2019 04:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMRRzBdYGAmjCi84Oik+o1hEPde0vMlLbqwfzhBep3Y=;
        b=TLkHehXCoUaUGstiwdj8fjVlz9gpUtcPChFOwjxmUtGkFfOi0uQ7WwBFH9q99o2YaS
         RyO+Ddp4ujrXZoIKDYOx4TOi+TqY9Mu5qkwdw83/3cvXoJW63WcWkgO+D01XxbKUhkNa
         HyqFjL7lLvZ6HfbuTZdSE0DCCBUUTUCRDluvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kMRRzBdYGAmjCi84Oik+o1hEPde0vMlLbqwfzhBep3Y=;
        b=qnMOjmf+Ri/2ToWHVKHsrhOEvg4Nc9nUpuL3wb2AxVrGxZjEJR4icvzDo7aIfnVer4
         NtOve9LN5ibxKBcSk4rgdzBQlnQmKp8yxWIvij6AaKi4+ndzdd6PkBzldJJpGJ8LbT+U
         95p10P9LgFPB9NhgRHtgYxchxY12KqFKUxBo7mY0NcwqKuHdKNNZYX5dDotuoR27/ySx
         bCQAb+jcYEf8gaMv4LARTrcO/W8cP2eZlKWYT1ijXpWj7JxTmKQpQXBrimQIa3vDIdP4
         6p1CwygjQvY+3XefrIEgYlN5oJY0lG1CaWDS9ziKAnuRnpt6Fw11DY4+SC3n7fxPBNWF
         7ZqQ==
X-Gm-Message-State: APjAAAUZG+jRZHiYOuZWUr/YRpwNjWBRZe+n6LtQMLdSA8rU2D4tHdm9
        lhH7MEP7UYMqg2N1ITFtiLwHoA==
X-Google-Smtp-Source: APXvYqz7pTQrY6+PNDzgbHOOx5ljSHLg2gy/5/9BxlS/JkI4le74b5m9Xs7646wgzBUgM1YLYIcswA==
X-Received: by 2002:ac2:4856:: with SMTP id 22mr19654061lfy.131.1572957089421;
        Tue, 05 Nov 2019 04:31:29 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id i128sm10953245lfd.6.2019.11.05.04.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 04:31:28 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: make nowayout sysfs file writable
Date:   Tue,  5 Nov 2019 13:31:25 +0100
Message-Id: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
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
 .../ABI/testing/sysfs-class-watchdog          |  9 ++++++--
 drivers/watchdog/watchdog_dev.c               | 22 ++++++++++++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

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
index dbd2ad4c9294..0c478b8f8d5a 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -452,7 +452,27 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
 }
-static DEVICE_ATTR_RO(nowayout);
+
+static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	unsigned int value, current;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &value);
+	if (ret)
+		return ret;
+	if (value > 1)
+		return -EINVAL;
+	current = !!test_bit(WDOG_NO_WAY_OUT, &wdd->status);
+	/* nowayout cannot be disabled once set */
+	if (current && !value)
+		return -EPERM;
+	watchdog_set_nowayout(wdd, value);
+	return len;
+}
+static DEVICE_ATTR_RW(nowayout);
 
 static ssize_t status_show(struct device *dev, struct device_attribute *attr,
 				char *buf)
-- 
2.23.0

