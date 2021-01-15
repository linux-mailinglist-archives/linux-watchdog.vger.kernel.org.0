Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4D02F7FA8
	for <lists+linux-watchdog@lfdr.de>; Fri, 15 Jan 2021 16:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731555AbhAOPeL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 15 Jan 2021 10:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731525AbhAOPeL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 15 Jan 2021 10:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610724765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=uQL+y58lclC99i4jP7TKYtNibWkWJQ2dPPctLldKk1o=;
        b=Rpr5X4iUB2R6U82OU1XAn82VxxkKUYLgWG73/0nomID+4BfbVV3yeiJdvhtS1BthTqUbMp
        vo3HxKHCdPVJgEo5I3Te2yIkbj4xSvwdXvohnzk535vqHRaGb7EVGl/K+P4jHGcdzt3DSG
        z2p1vR3luK/4f4l3RZ+JtqUAhUonRtk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-auWzJM7XPUuDg1q8hha3Vg-1; Fri, 15 Jan 2021 10:32:43 -0500
X-MC-Unique: auWzJM7XPUuDg1q8hha3Vg-1
Received: by mail-qk1-f199.google.com with SMTP id p21so8336005qke.6
        for <linux-watchdog@vger.kernel.org>; Fri, 15 Jan 2021 07:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQL+y58lclC99i4jP7TKYtNibWkWJQ2dPPctLldKk1o=;
        b=FbJMh3krdFPoD5QyVl9bLFBW6BpQJrTRiSFhtf96LoG2p2z2AMjUvNJ2/fRbTB4qf4
         pqu8G/W7vat0xuRDN8URDeg0sD36/Fdtv3xMRUt3qGyHvX1ogMFdYJmrwog5bimGEei1
         y03xaAg2mQ3up9jhoRLsJJHvjNx3Wweug3QxpX8Vqzjv6MSCctxQOEJ9laX1VtpGHmLr
         hrsK+mTe4KMsAkI4LDyIOdzBGQZ4+mduDr+40hLu59jUQFlPxD3wvjNBnaogbu8BsMvg
         WgqcLkTlzZRhBu3+KAZK2Agihx8mxRg+JCo8wvRQBtnYuToU9IfYxexcTth8tT3FgD2j
         hKWg==
X-Gm-Message-State: AOAM530PfPi+S8RrtfXdr/o1aDbXBgTAq+YQ9DWWu9O0eJTJga2GyV1/
        MGwSvCPYjWK2WjQRzdJIGRC9/+5kmI6JRJhTTUXB+g69B+WfNgzrAVLd2zJQkeWRAuTF+OKdEK9
        Rr1jZFGaX/X+Unz1q2A+BhQn7vXA=
X-Received: by 2002:ad4:46cb:: with SMTP id g11mr12557934qvw.42.1610724762973;
        Fri, 15 Jan 2021 07:32:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydqtydXxS6Dcp9UBw/bTH9W8nd87gjKMtLJJ0BeClPAzv1FDbQtrk98rkt5na29eTyfGC+Gg==
X-Received: by 2002:ad4:46cb:: with SMTP id g11mr12557914qvw.42.1610724762777;
        Fri, 15 Jan 2021 07:32:42 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 16sm5149606qkf.112.2021.01.15.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:32:42 -0800 (PST)
From:   trix@redhat.com
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] watchdog: it8712f_wdt: remove definition of DEBUG
Date:   Fri, 15 Jan 2021 07:32:37 -0800
Message-Id: <20210115153237.131357-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/watchdog/it8712f_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
index 9b89d2f09568..3ce6a58bd81e 100644
--- a/drivers/watchdog/it8712f_wdt.c
+++ b/drivers/watchdog/it8712f_wdt.c
@@ -31,7 +31,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 
-#define DEBUG
 #define NAME "it8712f_wdt"
 
 MODULE_AUTHOR("Jorge Boncompte - DTI2 <jorge@dti2.net>");
-- 
2.27.0

