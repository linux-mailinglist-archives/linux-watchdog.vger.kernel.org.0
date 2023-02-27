Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52ED36A35EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 Feb 2023 01:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjB0A11 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 26 Feb 2023 19:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjB0A10 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 26 Feb 2023 19:27:26 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D2112861
        for <linux-watchdog@vger.kernel.org>; Sun, 26 Feb 2023 16:27:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso1217638wmo.0
        for <linux-watchdog@vger.kernel.org>; Sun, 26 Feb 2023 16:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQnJvz9r//i40Q6M6D7Mlr1MIPxNoULnq+BRFHU1d6A=;
        b=a23NW50PF4pMGxYJT4CCynjxWmYi/cJUugpwl96WiTxeU6TpbJA9NKn2RjxsoxLzmY
         t6onK7Sd5ZbUCf4vsguGuWh+3A41HfXU4wWh+sXDVbcasv+0U+99LT7hOq+KSKB0NG+P
         S5oiiZuX6NNG3x8uaTWWJxUUEs7pO5rr141p9BA3NOc3HQK5DQrpMOV6pWCs7eKDDwsv
         /aursOpv8tK4rt9xQSfrE87giUJ/BWrLpQgTZaSiXINdpHNYRasWEezcr3gLneeabaH8
         EVUP9Clc0/E5BVElR7u9/9yGVWD3d/SvG8kB7HfWimwVHbFpveWFXwvT4ut+HIBbpb/J
         ttFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQnJvz9r//i40Q6M6D7Mlr1MIPxNoULnq+BRFHU1d6A=;
        b=Xi2S5gfq8Vx/ZKMM2KofKJg/QY8SuHB1YTgpZKwxlzga+aDuabGoRS6SeZUBbxrZgs
         RlrCjK19IXfIDs15rMV3M/sbTyCejjMeEaT5DSE+vzbGv4OFCa81gRTN5JGoJqk/vcF3
         YHEVHdERqRXLu9V8bW8qXkZbi6NnM3BTmBN/R+lSXWH7PILp/ZTAMiy4h8/siz+stmwE
         REnWeayBHoggLRF2nYoGVTTgUXQmOPtjJTXRypSIzzSLRCU3JrkStAn18K0wL8fb1sEd
         2knkkhW1wB3kUfA67qp/5WFNuS06jYeTyRhMiivHxAPVFRVjRe30Mz8Zs4wkgarUyLkO
         /RbA==
X-Gm-Message-State: AO0yUKVo0fYa70jjoDo5g62Y3Bs4qqgBUdykn6/M0off5Oan7uVmqU9W
        D3BExSe/7x8uGbt2jzZdfn6ZRLLBG1cRRSuQdvQ=
X-Google-Smtp-Source: AK7set9XdVTnviKXrck2xGYj7FdJ6tlPdPr6hb053vBbNBcdzfFKZ9H1A8BEDMpYJdPw7Go+/qzU70S4Y4zR5+VkfL8=
X-Received: by 2002:a05:600c:34d2:b0:3df:d8c9:ca84 with SMTP id
 d18-20020a05600c34d200b003dfd8c9ca84mr3195586wmq.1.1677457643492; Sun, 26 Feb
 2023 16:27:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:d1ce:0:0:0:0:0 with HTTP; Sun, 26 Feb 2023 16:27:22
 -0800 (PST)
From:   Raymond Dafter <raymonddafter4992@gmail.com>
Date:   Sun, 26 Feb 2023 16:27:22 -0800
Message-ID: <CAN3-JYm9YFvHmR04KiN5P9TKgaTd=Oap4mfRL6u_J0_vdy45JQ@mail.gmail.com>
Subject: We finance viable projects only
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Attention: Sir

We are interested in discussing with you, Entrepreneurs, Corporations
and Investors (start-up Owners included) with projects that require
financing also in helping you grow your network and offering you Loan
funds to complete and fund your existing Projects.

We finance viable projects only. The board will need to review the
detailed Business plan and executive summary of the project then
negotiate on the terms and conditions if the project is deemed viable.

If we can partner with you or your clients, We can send you our
Company Terms and Condition after review of your project plan and
executive summary of your project, if you are serious and Interested
contact us for further Information:

Thanks and best regards

Raymond Dafter
