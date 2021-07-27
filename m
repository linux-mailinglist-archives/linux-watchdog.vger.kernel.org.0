Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2C53D82F5
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jul 2021 00:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbhG0WbA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Jul 2021 18:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhG0Wa7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Jul 2021 18:30:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9336C061757;
        Tue, 27 Jul 2021 15:30:57 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a26so135359lfr.11;
        Tue, 27 Jul 2021 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/SCjQ6k9//GXJEqvZDsEY6bZX6p1yJ2gScgIlFn39Uc=;
        b=lyyNaZv5IGB4o3eWrTMxpAOcD2NhIQjh/Jd3CICdo2x4ElsJYnN/sHNCBDOaYQ5ihU
         syjv5oc0O2DjggSSq4zIaPdyAC2yVW9W7Ue6pynvP+cwm7q8hwx1d4LttFpdDQqX06Y0
         hQzATW0iTjqX7umvrEpNGyqp3MeLLv4asjqZ1NAJ9O4diGi2kPp+V8MZ9nL3R6iSggOo
         LkzKCw86gmlG2RytiLUDArBohdgCdcahq2byzLHoHAinPwq1wdZ51Rmk4bN7B4gtW4iC
         AgflMOSofFwvdU1EjhgbCknENASLqZld3RtxDNHRcHspAZFnVKQc6n9qWk3aGF2v3S/6
         mxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/SCjQ6k9//GXJEqvZDsEY6bZX6p1yJ2gScgIlFn39Uc=;
        b=tKWKUV2j9GTIv5VoWMRr0XYK572PMvTn7VTUiYwQE/rVAit8FQ+lyfReolQhevfnsI
         +XSvz3Qoe3MaVNmtohku2gEjyF4CNcnmjmZPeVVMpUBFedR4JT5a9ITheI/bsFPJcOEK
         gKOYu+Ov/2rBkcpNE3AszRwhK8mv5Hdmapu6m8bKdP5YzMAHkNp7+e3Y2/BXpVqtoSBc
         MMw2VTDlxQ3G/IsYonTao280thDpfBN4V4qeyGiTZwmNvRKfceMW9khkEIGuN1cTXopS
         rzrYQxRVmWwM0VVlulfgHltu76hdOosPLZ0r6QPpH+NW9oRmiXAlgCm6bQEVOE4edfY9
         cFlw==
X-Gm-Message-State: AOAM533soEkf+G01djz+OHNFM2qgk5kkZfwzooL7txw7FUEna744KKme
        UQTvCAbMYVf/rY9HIAWEbME=
X-Google-Smtp-Source: ABdhPJzMW6RR6GslbL4GbtNMzM1UoaNxuMFRSMrb4FDH1vc/yKVE/Kg4FMXPp7ExwuMZ51ZGUK++Fw==
X-Received: by 2002:a05:6512:39d1:: with SMTP id k17mr18135535lfu.365.1627425056159;
        Tue, 27 Jul 2021 15:30:56 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id h15sm406200lfv.45.2021.07.27.15.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 15:30:55 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH 1/3] watchdog: sl28cpld_wdt: Constify static struct watchdog_ops
Date:   Wed, 28 Jul 2021 00:30:40 +0200
Message-Id: <20210727223042.48150-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
References: <20210727223042.48150-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The struct sl28cpld_wdt_ops is only assigned to the ops pointer in the
watchdog_device struct, which is a pointer to const struct watchdog_ops.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/watchdog/sl28cpld_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
index 2de93298475f..9ce456f09f73 100644
--- a/drivers/watchdog/sl28cpld_wdt.c
+++ b/drivers/watchdog/sl28cpld_wdt.c
@@ -108,7 +108,7 @@ static const struct watchdog_info sl28cpld_wdt_info = {
 	.identity = "sl28cpld watchdog",
 };
 
-static struct watchdog_ops sl28cpld_wdt_ops = {
+static const struct watchdog_ops sl28cpld_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = sl28cpld_wdt_start,
 	.stop = sl28cpld_wdt_stop,
-- 
2.32.0

