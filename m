Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA034F50B3
	for <lists+linux-watchdog@lfdr.de>; Wed,  6 Apr 2022 04:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346993AbiDFBgE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Apr 2022 21:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447318AbiDEPqS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Apr 2022 11:46:18 -0400
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFFD91545
        for <linux-watchdog@vger.kernel.org>; Tue,  5 Apr 2022 07:21:08 -0700 (PDT)
Received: by mail-wr1-x449.google.com with SMTP id e4-20020adfa444000000b002060b7347f8so1629197wra.6
        for <linux-watchdog@vger.kernel.org>; Tue, 05 Apr 2022 07:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=m3vxItKXnUJTINlJEdj+JcIaXhSRzpBzJXMN0Ho5eps=;
        b=U/rCu1Z2QfNGh7871ZpZdN4wY/+Lh1Wn/I5Ha6phoPhUI3yRDteIeF+TZGPPbHc3Ai
         BBQSP1z5sD9b+wklr0ZXpHQDx20253jpVlFYCml1fsblFB2Q243A1smZeVhSbDbYut0u
         z7IHIiryy2SGXsp58k8lugrnBQWpAfe4UaUoIoiLNUWU6VPrmVSPjgLFVRjjlsnuviJh
         g2vIiFzGHXI6KSMbAEIY16WttCiHeVwLMIUVeWsgv9R9tws08lP2EReN2yTioJTEcmxr
         8dTXpSzd/4Gkzv5UDngHARkRMF8rXO+CxVkuFg6Z/c+C3T3Db9QNzs4r4LR3an7j0BQQ
         bBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=m3vxItKXnUJTINlJEdj+JcIaXhSRzpBzJXMN0Ho5eps=;
        b=low81s8NlklrxSGuRDafHsgWSpGsv3AP26prbEQ4LToKS35bDNWlIRNsGmyT8eMCcL
         04ZPp/9WXc+i5CniUBqcQh1HGW8UNnVXTvwAeZrOH0tzB6rAh+9uUs0lsOCyeup8Wwgl
         Id/9odvX8j35NgxIIQu5bFFeXROCceh+qLVq847gUyvoT79uqZDB69I2Anly4s58GdPX
         GyzJS33yHsw3jry2p52WoAhKutD2gp/xRQ0TTr2LO0Y8pY0tsSpN/eeZ+Afd9++h0gJy
         nkL2jDJI3qWiklzo7rWLtIy8/5PKtJs0VDYE5HtrZo+Bh1HFZkiG1uO1X732OWFzPh/b
         UVTg==
X-Gm-Message-State: AOAM532SWFjWJvlpPqV4uovKUw6qtXu1YV0PlQ7hX5Mw/+AxEM/wlJ15
        3A94++0dPUk0SBJXIdsNg8zFB+GDMikEFxD0AbI=
X-Google-Smtp-Source: ABdhPJwN5QFMBNAx6z4lJuIDDPZMY0wbemxu/vZ7lASsb58ZkL62PcBPIS8ol+sPOaL6RzriqT4z3Z6RSNAw7S3JJqU=
X-Received: from sene.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:27c4])
 (user=sebastianene job=sendgmr) by 2002:a05:600c:4f87:b0:38c:adde:1d99 with
 SMTP id n7-20020a05600c4f8700b0038cadde1d99mr3320464wmq.16.1649168466877;
 Tue, 05 Apr 2022 07:21:06 -0700 (PDT)
Date:   Tue,  5 Apr 2022 14:19:53 +0000
Message-Id: <20220405141954.1489782-1-sebastianene@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 0/2] Detect stalls on guest vCPUS
From:   Sebastian Ene <sebastianene@google.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, will@kernel.org,
        qperret@google.com, maz@kernel.org,
        Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This adds a mechanism to detect stalls on the guest vCPUS by creating a
per CPU hrtimer which periodically 'pets' the host backend driver.

This device driver acts as a soft lockup detector by relying on the host
backend driver to measure the elapesed time between subsequent 'pet' events.
If the elapsed time doesn't match an expected value, the backend driver
decides that the guest vCPU is locked and resets the guest. The host
backend driver takes into account the time that the guest is not
running. The communication with the backend driver is done through MMIO
and the register layout of the virtual watchdog is described as part of
the backend driver changes.

The host backend driver is implemented as part of:
https://chromium-review.googlesource.com/c/chromiumos/platform/crosvm/+/3548817

Sebastian Ene (2):
  dt-bindings: watchdog: Add qemu,vm-watchdog compatible
  watchdog: Add a mechanism to detect stalls on guest vCPUs

 .../devicetree/bindings/watchdog/vm-wdt.yaml  |  44 ++++
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/vm-wdt.c                     | 215 ++++++++++++++++++
 4 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/vm-wdt.yaml
 create mode 100644 drivers/watchdog/vm-wdt.c

-- 
2.35.1.1094.g7c7d902a7c-goog

