Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2E44CE50C
	for <lists+linux-watchdog@lfdr.de>; Sat,  5 Mar 2022 14:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiCENr0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 5 Mar 2022 08:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiCENrZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 5 Mar 2022 08:47:25 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BA53B3EA
        for <linux-watchdog@vger.kernel.org>; Sat,  5 Mar 2022 05:46:35 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2dc0364d2ceso119852517b3.7
        for <linux-watchdog@vger.kernel.org>; Sat, 05 Mar 2022 05:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=k6NYZQl2rxZhVB/aKDQvMsV5vW2gUENZyGD3qWaMtBI=;
        b=exe3gh+u5bF8l1dRSyODrKd+EUl5T+bKxMTDSPzrX4cPY+eUQ9kWP8p4RWTiiNWMYR
         PD1aIlL4bNQ/jEyYBe8oHh9Hh+VtJjbbaOkgoWLGe3qPVwDWsTcXTOxxoElMt9kZbBVd
         9XR8J3GtYCV8wQvm3bLV+0SPJohdxCEnwjvzBSwbAOL6WfKAPtWXO+VcOJMFkC+LeD+Z
         zOx1QpJcI/Fa2aeGNpCxPWC3oWMt3E6cKSsJ+ZHdDOba07GTeEgpvsXwG0To6Bom0mXY
         jYYp49g+oGW2xV1t4pMW26uRPS9r4S7LZo1EnZbrQ+g0GSn2zHrLa+qRZuZ2LPMfaKwn
         FJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=k6NYZQl2rxZhVB/aKDQvMsV5vW2gUENZyGD3qWaMtBI=;
        b=BG7Hgf6gEn+uadliHE+2bGuHLFUlek7I24AUwA6/IsGSb/yPl329bZfxEre/HjRmcf
         xT7NpditughACwZbpMAvOmvlHKVY/XhkTlfWVjcVq4bJkIS5Tz4R8MwaqKInN2qcfCMM
         c8967vcjgjxut6dMrQuy2tGu/BDmY2Q14Yw9UXDomUCQoyG024FbYcpI8D+cSakGL/WD
         1jEGgfWtRFjAhdfJAXgv04spbrDBHg+jHOd9Y81qjSHtkRImGnTi1vKRKRp4ARrgU8Z8
         SdEH4AUpWdWAxuhfwae59aO1taGvqGyEeAXktHDgbWRLEovpeB8AXy069jV4IKGt0+VS
         7VbQ==
X-Gm-Message-State: AOAM532LVaT0eCm6DfQ5y16ZUVcjNMtgaNXxRcYcH/H1D08fkyhjbWzc
        hXmMoLQChnBhOr3ca3+oNfk5nRdMIFJOlqDWR+U=
X-Google-Smtp-Source: ABdhPJzL93gJpeaR3JQg3Uhmv0Np3h0s5YqMRJNCS6vlUvP7J3OGqhWVJiKaGPYILO52Wb0rZfcHGo/zIzyNofteqbE=
X-Received: by 2002:a81:19c5:0:b0:2dc:a22f:80ab with SMTP id
 188-20020a8119c5000000b002dca22f80abmr502912ywz.229.1646487995020; Sat, 05
 Mar 2022 05:46:35 -0800 (PST)
MIME-Version: 1.0
Sender: edithbrown0257@gmail.com
Received: by 2002:a05:7010:cc8a:b0:210:741f:4d30 with HTTP; Sat, 5 Mar 2022
 05:46:34 -0800 (PST)
From:   Rose Funk Williams <rosefunkwilliams02577@gmail.com>
Date:   Sat, 5 Mar 2022 14:46:34 +0100
X-Google-Sender-Auth: YoxlCIp1P0MGBsM1jL_BYXGKb8A
Message-ID: <CAEbKRu2r343HkC8Nxbsdm1SiJgGgbsKqvZ0WS+T-uyyRUNVNSw@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
Hello,

My name is Rose Funk Williams, I will be honored if we talk and know
something about ourselves, share pictures and life experiences, I look
forward to your reply, thank you.
