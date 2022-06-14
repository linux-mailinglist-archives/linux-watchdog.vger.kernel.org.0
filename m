Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22B854B2A3
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jun 2022 15:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiFNN6x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jun 2022 09:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbiFNN6T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jun 2022 09:58:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4EF3334C
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Jun 2022 06:58:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so4840230wms.3
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Jun 2022 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=DCTAW+jxn8EwW1x6OBizHmeUgodcWGmb8Wij2is3rxU=;
        b=oXxCGb5fLaBb6wycfCYYsp8SIpPadW/szVIiKcLasIVeEVOxwtqQA1kKyq3QRGZWz+
         Xm24H1bdQXEhU7+IbrfsGo6GvjZpHTZnGo/MNEvdHms9iCIo38ftM9M89pzAE4se4hMN
         lHoqrSYsKtA1oiN4iyY5CI49UVVq9yMqkb7I9xm9P1SY9CNZjWdNI/Gf8lf5nq+X+4gQ
         bpv3+mDYnWoQmIVozkjOMuhhFdoKaTPsjPY4BYzcfvIMXP3bGk1l614/gSaRRwUPNg+Q
         lc6Jj7xVXopZSVp+gwE3Dw0mwVzCQwmUIJIMpYZS/7OP2/+VW+D/AVWfstSjqGcoxTDl
         PAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=DCTAW+jxn8EwW1x6OBizHmeUgodcWGmb8Wij2is3rxU=;
        b=DcePCmKM59PKriy3zQIkKGrkhxR0/3OPsLNJIyrGTy/rPQ1wGYIyWVrLnpw4BefPZU
         nhnJa9sj9JLMM9cN+7NDyUcugJkD/y6z9Qlz/51/9vLWDBo6kqHUbLYHBDSPyRqbeIBa
         XUi6F1hz4rGLUvqOFNt1eVQSdR5FF9wwX1ROYEL17xkvytuYoRmZrAF6UVy1L9kF5Adx
         Zuzs3WobyYS0t9w7FaDIxD9xt7Txtu/hXhLdSYTomW5wxGjpuLgfhwv46nf9ki+3544h
         u7S6iYDSMAU8zwdW5zd/0Ijg19+gzalULsikYU6n9D/oVmUC0Iaks26R+cg2oTVJs7Cg
         BJeA==
X-Gm-Message-State: AOAM530GBafVh0ekc32JngyrJT1iv57M+sLAK+Nsl0p9UAAuHGrOtFh1
        C0cIAd5El2jjW69bAjUZ/SSmvrvFxoncVrTMrys7YyDvZHdLTA==
X-Google-Smtp-Source: ABdhPJxl7ucuLJQhKe/EtAW39u2ISb75+nRWVw4k37kUXOInchW1+a576qscdgH0G1GWFDIWN1dapBNf1oUJAOPeKkc=
X-Received: by 2002:a05:600c:35cd:b0:397:7493:5efb with SMTP id
 r13-20020a05600c35cd00b0039774935efbmr4315229wmq.95.1655215095674; Tue, 14
 Jun 2022 06:58:15 -0700 (PDT)
MIME-Version: 1.0
Sender: gogohezou@gmail.com
Received: by 2002:adf:dc82:0:0:0:0:0 with HTTP; Tue, 14 Jun 2022 06:58:15
 -0700 (PDT)
From:   Kayla Manthey <sgt.kaylamantthey@gmail.com>
Date:   Tue, 14 Jun 2022 13:58:15 +0000
X-Google-Sender-Auth: Zl1JbC_0cVUwK6EjK2ByXH-iMPw
Message-ID: <CAEG5Zth7ADqUWwa0RiCkp6_rTRF7rwy92AYZOiFLz1pA0SiLxw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
Hi  dear, please  i  want  to  know  if  you  received  my  previous message.
