Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0B3379FAE
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 08:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhEKGbI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 02:31:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41867 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEKGbH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 02:31:07 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <juerg.haefliger@canonical.com>)
        id 1lgLu4-0002g7-Kg
        for linux-watchdog@vger.kernel.org; Tue, 11 May 2021 06:30:00 +0000
Received: by mail-ed1-f69.google.com with SMTP id o12-20020aa7d3cc0000b02903891695ceabso10376777edr.3
        for <linux-watchdog@vger.kernel.org>; Mon, 10 May 2021 23:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OtH4eWQldqUSkW4yxRjOEpNcMPcTYEmH1QrZivGyJ5I=;
        b=fT2oLdQ9CHlZoEdVroNi9b3tznDKECMWLzprRbxCQzzuDy7OuGT8BBEOlRTxp/twTK
         wFw4nBw3Yhys5CtWKudvXQXEHTx+BjeDUuiG1cMIXt4jBF2MRzN/gFhdpvzNPsDjxaWq
         skaJl+53ZlcXClXDZhkkMaXMjYJIDosct48QU2cO1IsUIAXrzBilGH2P4BgVdKswqet6
         9QvNBpgxII4IH5LLbTs1s/DKwrBab7bB48Wx+FtEn8sheh+1tFsPr6AV3dgdBbL7o9W7
         fa5/D8YqUgU7orfaS1lfUJ8RA7fwDoYJNWSM7VzteXKVUxQ++2Kh36tZe3bPQ4gePMcr
         7yeg==
X-Gm-Message-State: AOAM533qAPOzDkgEm0ZtOq4vyHVMp1RnqTVwvzVluEujbzD5sSxFerhd
        60vgURUBRQ0ues/T5g72/vWRC66way6um30LurL4H/Jo9Q/Y1cT+YR6byQu2G4o1IOZfuwI/jJs
        +Bd2zzWOFEJFNZ4hrivhSSU/LibObdwzSBVwaBa+jP6hc
X-Received: by 2002:a05:6402:110b:: with SMTP id u11mr35335788edv.356.1620714600385;
        Mon, 10 May 2021 23:30:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0sMPdfW5EZzNP18EtpiuVYKvGJqnPmXoBsW2Wozhs74M15B6ytpkafIoFx8aXfada77AYwQ==
X-Received: by 2002:a05:6402:110b:: with SMTP id u11mr35335779edv.356.1620714600254;
        Mon, 10 May 2021 23:30:00 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p22sm13511530edr.4.2021.05.10.23.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 23:29:59 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH v2] watchdog: Add {min,max}_timeout sysfs nodes
Date:   Tue, 11 May 2021 08:29:53 +0200
Message-Id: <20210511062953.485252-1-juergh@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510131625.21506-1-juergh@canonical.com>
References: <20210510131625.21506-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The valid range for the 'timeout' value is useful information so expose
the min and max timeout values via sysfs.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---

v1->v2:
 - replace sprintf() with sysfs_emit().

 drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index fe68a97973a5..7c1007ab1b71 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -526,6 +526,24 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(timeout);
 
+static ssize_t min_timeout_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", wdd->min_timeout);
+}
+static DEVICE_ATTR_RO(min_timeout);
+
+static ssize_t max_timeout_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct watchdog_device *wdd = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", wdd->max_timeout);
+}
+static DEVICE_ATTR_RO(max_timeout);
+
 static ssize_t pretimeout_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
@@ -610,6 +628,8 @@ static struct attribute *wdt_attrs[] = {
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

