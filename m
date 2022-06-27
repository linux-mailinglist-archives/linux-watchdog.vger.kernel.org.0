Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F4F55DEBE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jun 2022 15:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbiF0Lxn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 Jun 2022 07:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239038AbiF0LxF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 Jun 2022 07:53:05 -0400
X-Greylist: delayed 1953 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Jun 2022 04:47:36 PDT
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34176DF5C
        for <linux-watchdog@vger.kernel.org>; Mon, 27 Jun 2022 04:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=clyFm7ZlvqCigNziCXoNHaIsHcxkM61AEKy22Ewt020=; b=jfQfzwQhiVeqQtbTbkHOHfge7T
        wDEai1DnEZI84JmkOFPP7ISBBOhZlgKEDh8EnXrSV6EN+dUPXWCcJahcWj08vyIw5kR/qaH6o/ks2
        vste2OzcRYCefdkHfqDEcgMXnsLrsmzviNFYrqZiLnAmoHqpkPYLyPopIYDR983RTvFSYlWYa95fD
        CBEtmj7oE3dwq7AK+0mI1CxNqp3+bfBN5smAqTVDTCX8Z1tb/IumjJ4QFu4CzuKhiww/lPoTbDcDM
        TiEuFNzAB43zmg96iLtZZ1L7LTlyMxggdwEZv0GzYaZK2WY9LXubxJM9nyJtenucaI6sFlamyh8ye
        3iPTBfQg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o5mhm-006C6l-Ae; Mon, 27 Jun 2022 13:14:58 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 0/3] watchdog: pm8916_wdt: Some minor improvements
Date:   Mon, 27 Jun 2022 13:14:29 +0200
Message-Id: <20220627111432.2625168-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Optimize the pm8916_wdt.c driver a bit by pinging the watchdog using a
write instead of read-modify-write. Also report the reboot reason to
userspace and (temporarily) ping the watchdog from the kernel if it was
already enabled by the bootloader.

Stephan Gerhold (3):
  watchdog: pm8916_wdt: Avoid read of write-only PET register
  watchdog: pm8916_wdt: Report reboot reason
  watchdog: pm8916_wdt: Handle watchdog enabled by bootloader

 drivers/watchdog/pm8916_wdt.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

-- 
2.30.2

