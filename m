Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A73378F5D
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 15:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238114AbhEJNnW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 09:43:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44920 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240563AbhEJNS0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 09:18:26 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1lg5mc-0008VA-98
        for linux-watchdog@vger.kernel.org; Mon, 10 May 2021 13:17:14 +0000
Received: by mail-ej1-f71.google.com with SMTP id x21-20020a1709064bd5b029037c44cb861cso4729544ejv.4
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 06:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vG3tTWsmMu3oqxb/plnA4yFpnSWfUCGEOED97VmRmp4=;
        b=q1qtU84pKh10JFhHI29qcF69AtQ4ATTDdyPP9rGGNwpQUHvewoSl0N0nhPJvMSz0CZ
         864jKSa5H33yXPiSAspw4zq4eGAWhubBCPWjbmDVsvLEwFBoFQy5Qze32K+wZ1jh2l2T
         KQSJzMPXkzog2uABa5gCSBQV9i/by6xHrQECnrbo4RXyaL7tMYkicHO9PCTvxGNcdVbh
         Orb3ybt+Sks1AJjQlC7Z5brlzEGrOvUXR/045dA07aCh2KbcQv4+HTvOGAsXHheztv+1
         n1wraDV/p1QFEB4NQ1pNz3ALY+fiYZ/S674W6wA6cGjgh22P5J9SntfqzKmdiSrh3lfa
         NBcA==
X-Gm-Message-State: AOAM531GpNe1bJdHlRBc0KFwvL9qGSILgiAEsteAg/81HtEK1CHN5OEo
        JxL/CpCJa2E9P0bsMElnr7D0um6aQFcHYyUmEBIIIsZHCRh1LA1MHMx+tzz/X+0zle11AImcjii
        im9dHVNx+cNhH7MnWJVoP0cQIxd41YU9sp3Qjly222Byb
X-Received: by 2002:aa7:c150:: with SMTP id r16mr28881486edp.82.1620652634046;
        Mon, 10 May 2021 06:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztp1MixkujLzViLZ92V7b0dpslg7cIAsojR9bew+6zXzFZNGNVNI/oYuSZ6wQQX7SK/BgLZw==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr28881458edp.82.1620652633840;
        Mon, 10 May 2021 06:17:13 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id b21sm9116750ejg.80.2021.05.10.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:17:13 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH] watchdog: Add {min,max}_timeout sysfs nodes
Date:   Mon, 10 May 2021 15:16:25 +0200
Message-Id: <20210510131625.21506-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The valid range for the 'timeout' value is useful information so expose
the min and max timeout values via sysfs.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 2946f3a63110..b84d53a79618 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -525,6 +525,24 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(timeout);
 
+static ssize_t min_timeout_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", wdd->min_timeout);
+}
+static DEVICE_ATTR_RO(min_timeout);
+
+static ssize_t max_timeout_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", wdd->max_timeout);
+}
+static DEVICE_ATTR_RO(max_timeout);
+
 static ssize_t pretimeout_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -609,6 +627,8 @@ static struct attribute *wdt_attrs[] = {
 	&dev_attr_state.attr,
 	&dev_attr_identity.attr,
 	&dev_attr_timeout.attr,
+	&dev_attr_min_timeout.attr,
+	&dev_attr_max_timeout.attr,
 	&dev_attr_pretimeout.attr,
 	&dev_attr_timeleft.attr,
 	&dev_attr_bootstatus.attr,
-- 
2.27.0

