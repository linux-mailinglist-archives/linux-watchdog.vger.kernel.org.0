Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1256852C721
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 May 2022 01:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiERW6T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 May 2022 18:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiERW6I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 May 2022 18:58:08 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBBD17DDDD
        for <linux-watchdog@vger.kernel.org>; Wed, 18 May 2022 15:57:12 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2fee010f509so39874347b3.11
        for <linux-watchdog@vger.kernel.org>; Wed, 18 May 2022 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=czYkjWVoP4p/ZkNBJUSmJBfxUUt+Y13DbrrHvBfDUk39swnu2r1R2LMB3wAsUSY8FJ
         6ZHix6GZx2AHI61Xybet6sdcQlFElibcif9NAvmWTzz0l58WRUD1Pr+/0udl5Tub4w6J
         meMNyRnYfYgN6d8AQA50exC5S8Br4+BjGl3igVF9bo6vnyZ0caprRk+RWxvnLby0Adqm
         hPjkVM8mttTA162cBcx8kN6mr4q9cNJsYcLYU7yQFFkOaGBf3QJSI1TLD1TTjQK6bKO2
         /uQaa7XB0ntetoq2a8c8ZgimsW4075bFpPpigSla9RqML/vkCGJpD6xavnQrqxd781aK
         ZwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=cqf3D7NGHf1jOCBkPazu5nuRiP6jnH2o9l0HJdCHqD/YTQBIaIVrx46q7qz1wwdTZx
         Uv60Cnuzun1214m4ZTZ034zt0WigRCgoFykkQsEAhfJmUYnTRMM3Rq86rLbIgbOgXxtq
         mpf/98A2eDsWjyjtfBBMSc95DJv+GVMIinYkxcyGAvTjd8E0XjqTauz2pEGj5THO5Tpk
         sMG+nO0O4vvfa+W2V9l6zXKUxrwJXibrqIAymOL6gvWT6Y3vpb9yrxVdBfby61JbjzMO
         Xe1R81/fOG27ervPzt3dda3V/6sr2Ziw2gBQrvzqGVRXd/4inDVrCrBpJZTAqLTLHAEo
         7Dng==
X-Gm-Message-State: AOAM530lzeMFHPqns4nzpt4ghv1JYybJ0nTEznQqQJp1pstFWAYPvJXK
        uKfVuoB1MDlFaJ71Qx4ldN//WEsAX0Jw76hLdyg=
X-Google-Smtp-Source: ABdhPJwfS30wbsCjPY8UVYlWs7ui3rJia0tAtpKvKb7UJ9kvW7xj8JsSqbuzt2V828J/37SMn7X7nS55vBF2Wrce63I=
X-Received: by 2002:a0d:ccc3:0:b0:2ff:4e0:2be5 with SMTP id
 o186-20020a0dccc3000000b002ff04e02be5mr1833971ywd.225.1652914631436; Wed, 18
 May 2022 15:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:57:11
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 06:57:11 +0800
Message-ID: <CAE2_YrAOSJNMn2masB_R9LowQvWJNrct3SYBUk3PivGhjD0fCA@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4054]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Can I engage your services?
