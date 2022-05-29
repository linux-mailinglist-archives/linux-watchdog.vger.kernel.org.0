Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441CD5371B3
	for <lists+linux-watchdog@lfdr.de>; Sun, 29 May 2022 17:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiE2P5R (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 29 May 2022 11:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiE2P5R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 29 May 2022 11:57:17 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C3EE020
        for <linux-watchdog@vger.kernel.org>; Sun, 29 May 2022 08:57:14 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id e184so6002188ybf.8
        for <linux-watchdog@vger.kernel.org>; Sun, 29 May 2022 08:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=AeVFakHwl3ShYUBAR+wdaOObcRjyc/4J4NF1aui8ojiGKJ3nldxlTO5LRf+moLwZ8b
         jPkn+YN7s/pob/eiNionXmdzFcqhA/Y3fNNZeD1uz0D/O8v2Gk5LtCoaKNERUBoJJNm5
         Zb0v8IpfdOHRyVWSVNnhW2paJ+fGO9xUvNVvSjOJiM+w2Nb7GXc47OQERjR9BWvycwwt
         0EPqSazouzwwZV046OphnIKEgnrK2OSTuE0zTOluJUGlZM/wnsi2+91UjLS/AjgWtpQD
         D5Eg3JgqeigtpHkBDFG4vek9r+NKDCsmWAjWYdkIb6UodoQUV74U/OS1I62CQYSeMOFj
         6WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=YvCEE9BUEPhPQSJUIYH54qKFMYal74wspi5yo7W3qtUdwYHIyct3ZlYHn8pT8DmZAU
         KlqYMosm3fuJjIEjSX7SyKGq92QUEHPmjg90S7kMQogm3qALuOeingHxn+KsYcscvBTE
         lPKg9/WPGg8bej+gM780GC7RiCtJ9YwyzST7trC8/x6M/nYTzL0G+6ULT70XEcBg0eee
         uKhWZrF8KFb6+AbzyDZDI+esMOMTA1bghQXqH/XdZsds6T/cE/w9+IHMaaXxcocak3Xh
         yfbUfi7tYVYeqy7rjdX4ZrMsbMIhWiAasGljx8UrQ51qIn29QKsopPe/24okjbdOO4OV
         F4hw==
X-Gm-Message-State: AOAM531uWA8Viaz550JUvO9nW2e2p80sAoFgnNmwi8wr8iXJBXk7v3f0
        71UZv5AAc4RPXdnLoI5H6H6P03D+iUoTRViu/jnzahJbUfo=
X-Google-Smtp-Source: ABdhPJyL2x6MVUkHDYX54WjUueaKVacWuK/Q0kt8PsgUpOOA0Qa8tDhgfYiMmeFbY8lxlLx2xmPfewvciA4Sk1Geac8=
X-Received: by 2002:a9d:6e97:0:b0:60b:3a60:142b with SMTP id
 a23-20020a9d6e97000000b0060b3a60142bmr7434793otr.217.1653839822359; Sun, 29
 May 2022 08:57:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:560a:b0:a3:6e92:e156 with HTTP; Sun, 29 May 2022
 08:57:01 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <m.evelinemartins@gmail.com>
Date:   Sun, 29 May 2022 15:57:01 +0000
Message-ID: <CAEvQOXRgPP5GhpUshtwVJ9oGTJHaFEEej5XOpmhHV+oYOMZHfg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,


I wrote to you this morning because I have something to tell you, please
let me know if you read my previous post today.
