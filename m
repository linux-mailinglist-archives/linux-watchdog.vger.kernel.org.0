Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7BBE6DBB9A
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Apr 2023 16:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjDHOfV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Apr 2023 10:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDHOfU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Apr 2023 10:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFC1CA0B
        for <linux-watchdog@vger.kernel.org>; Sat,  8 Apr 2023 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680964477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DkwXScb6wJOf3gN1DF0csk3W5arFQbdl8U7x7u5uuJY=;
        b=I3iL7D8sj8OAkv9cl4y/a4x8x6xSFR/bTpC0bZgcBI9RJyobbeVEo/hZzXXCyKKrszQxAc
        BrTlAeUZP4dmkKok+nrl7tC8+r9vRkj/xgr5StdTQ3oQEJmko6ggXVV6uIlLem/5K88GjT
        Z3M5ct3Eeg0BUpPfCO/oUcepJLUFQo0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-d5AkSDWxMB2-0RdtwyPw0Q-1; Sat, 08 Apr 2023 10:34:36 -0400
X-MC-Unique: d5AkSDWxMB2-0RdtwyPw0Q-1
Received: by mail-qt1-f197.google.com with SMTP id a19-20020a05622a02d300b003e4ecb5f613so25116501qtx.21
        for <linux-watchdog@vger.kernel.org>; Sat, 08 Apr 2023 07:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680964475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkwXScb6wJOf3gN1DF0csk3W5arFQbdl8U7x7u5uuJY=;
        b=tT0kpl/xNvhuM7pSVGz5ee7+E1Mu2y/h1jecOOKne3nxqxuxYFZyT4XcsnfDV2ZkXN
         T5iT/ilTOUrAey+5FIreW35f/AXyClVeiRHLYz88GbfUgDO56OZ+SibrbQ4mvTIu7pDN
         Lhw5AialUql13lc1EHHIvPW+Qb1TarQcMGWJrcZ5Uqbv39O33rH12QLsj2NOF8PcJf4N
         RcXCFb4ZQfOQYo1E8AFaMsOdzY2ASKfWv1N4zUcjwOHjFL9/g3Twf9QamHBycpPBWgkY
         Od0AGj0JnIE+2PFVBREo6AjrLjHK2G6GTK9eiJ6JG9ywAm0/bNICB8GOjbtEjU8G+a9G
         qSJQ==
X-Gm-Message-State: AAQBX9dJDK0aybBG/lQDnpPGnpd3AbM22EctQ+7+AMmyyWLsfQTxsChl
        1wwP8unui0CW11U7cDevrDAXOTxg0OiQVHcCShH8jLzvjQSZvh+UEmN5VyWTjt7kszaDGr3X293
        k8B46dwVqXRG+mUH8XxnNyVq3XQM=
X-Received: by 2002:a05:622a:4c7:b0:3e4:dcb4:169 with SMTP id q7-20020a05622a04c700b003e4dcb40169mr9743248qtx.16.1680964475599;
        Sat, 08 Apr 2023 07:34:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350aAR7H0F5jPDDVc1edXP9xa5hxjAFdJuVIN8Z1zdzOziO42c3nt/PGgaPOuNhsa12OAr9APPw==
X-Received: by 2002:a05:622a:4c7:b0:3e4:dcb4:169 with SMTP id q7-20020a05622a04c700b003e4dcb40169mr9743220qtx.16.1680964475319;
        Sat, 08 Apr 2023 07:34:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g129-20020a37b687000000b0074865a9cb34sm2052931qkf.28.2023.04.08.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 07:34:35 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] watchdog: imx2_wdt: set variables imx_wdt* storage-class-specifier to static
Date:   Sat,  8 Apr 2023 10:34:28 -0400
Message-Id: <20230408143428.2704141-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

smatch reports
drivers/watchdog/imx2_wdt.c:442:22: warning: symbol
  'imx_wdt' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:446:22: warning: symbol
  'imx_wdt_legacy' was not declared. Should it be static?

These variables are only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/watchdog/imx2_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 19ab7b3d286b..6fcc3596103c 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -439,11 +439,11 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
 			 imx2_wdt_resume);
 
-struct imx2_wdt_data imx_wdt = {
+static struct imx2_wdt_data imx_wdt = {
 	.wdw_supported = true,
 };
 
-struct imx2_wdt_data imx_wdt_legacy = {
+static struct imx2_wdt_data imx_wdt_legacy = {
 	.wdw_supported = false,
 };
 
-- 
2.27.0

