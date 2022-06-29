Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F48055FAFE
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jun 2022 10:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiF2Ist (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jun 2022 04:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbiF2Isr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jun 2022 04:48:47 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019773CA69;
        Wed, 29 Jun 2022 01:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P1k34az4QuGx1B9bktihgNb2sebWNTAJQ1q0AlyQj00=; b=dAYNbbxxZ6yM98ungoOfGIbzEy
        1HXsCNlj98NoIjl0Eo5zO3FA9LIIhbrnuWIQBnSQgv4lCUv1hChr/lgm3HuqUXd2RiHML2YyQTcku
        ul9czCf8pGqvPKi+SFq11j75TkVG3eIvjkAo2yLb2eUl97SClKfgmRRHRlRu6IdWUpgZEw24rauUP
        IEMyDJUZuS4BPk1aXjA7vCTtPywW7M+dhu0Sbrqo/FsFUY64DAouRrZRSkzz9PNuIE83M/xEtf69U
        3B2UFZ0KIMoAUc8XAow6EOT/BAPWW+IgzEsjB52I/R+rOl+E4s3uLOflJ82d6WlJyQKkWEgnLxWqq
        MqtTw9Tw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6TNG-006RUL-A2; Wed, 29 Jun 2022 10:48:38 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 0/3] watchdog: pm8916_wdt: Some minor improvements
Date:   Wed, 29 Jun 2022 10:48:13 +0200
Message-Id: <20220629084816.125515-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Optimize the pm8916_wdt.c driver a bit by pinging the watchdog using a
write instead of read-modify-write. Also report the reboot reason to
userspace and (temporarily) ping the watchdog from the kernel if it was
already enabled by the bootloader.

---
Changes in v2: Improve error handling (suggested by Guenter)

Stephan Gerhold (3):
  watchdog: pm8916_wdt: Avoid read of write-only PET register
  watchdog: pm8916_wdt: Report reboot reason
  watchdog: pm8916_wdt: Handle watchdog enabled by bootloader

 drivers/watchdog/pm8916_wdt.c | 41 +++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

-- 
2.30.2

