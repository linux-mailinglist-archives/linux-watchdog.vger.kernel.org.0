Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D7C51B438
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 May 2022 02:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbiEEAGj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 May 2022 20:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352230AbiEDX6y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 May 2022 19:58:54 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298F0506FD
        for <linux-watchdog@vger.kernel.org>; Wed,  4 May 2022 16:54:13 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id w17so5041930ybh.9
        for <linux-watchdog@vger.kernel.org>; Wed, 04 May 2022 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ampHH5WJLIBWSsxWwzVjbk5pO9UBFxn81pZ6QIDzZtY=;
        b=Dn1MT8x7p4Rbn+pctwVkt7IgIdUxT0LRLjox/JaF9ttsZ2N8sUUglHFRxQa3sl75aK
         h1U1JpCoOjPff8rV+LL0edQuBh+YvYlTbZ4zx127Qa80qMcS49J0d2nS2s7mVVadwp/M
         vGp6wV8qQhR9tMRiQjyWHIJslgvG4HigF7p24aLxixJ1l99K68kLikab9Y0HgtSpkDYW
         0+riuhXlj9dAnGs04evyYz4sFXKtm0FlJKiBI2Dtbo7ebvKr6E7XJkxgxzCXhReMwL1D
         yv9OUeo9KjH+/RIlVXefhsYivAQRdlwo604eWoXrrvRFVxcSgXwgPis+UtVhyLpBWx3z
         WyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ampHH5WJLIBWSsxWwzVjbk5pO9UBFxn81pZ6QIDzZtY=;
        b=5Iw3pdi+EL3ig3dxtZGiesthdp5eZBEfOvPV6XVufwqVW1XGC0sYYe4aDrkkK/zHPp
         u7XvGwviXXMMqiHBCErCrNXNAdpymPoLK5MXRw19TN4ffvJP79Oi0auJSvGlXPfu8o39
         CLDX6KHX9anpAb+wTbOkB+U3xtaSI/3hf2P5hTXlzYQ77kawNBntP6IT8k9IcajRpvYE
         hK1DuehtJsuAnA4bGnmexRiq5Rn2eDPZueX2YmUFicXcbeMo9GOrKb/ZPvPUQoLoYPV5
         tzwA/lsH1eaAKXOGAOuxKd9XyIvU7OIDTJIG+o8lDhIcxiIoOO4IOuxMp9DgQK0NqRQX
         qXTg==
X-Gm-Message-State: AOAM533Ny7+9i3Lrpjt2MboVDswAz8MGV/F7Vf6wd33hUJ8mNv719Rd+
        BBy3oo3i8499V3IZ0r7Ppo8OmpT9t8Cydqy+r+z0114aCKMfLw==
X-Google-Smtp-Source: ABdhPJyXbFHNtxfp8+qt+M9kuv/iG7XfFeFFPd7I4/fmpdxuycMtmf6dIJw5ghtZAT2CwgvAVE/kUl0HxsirxLIU8v0=
X-Received: by 2002:a9d:6b16:0:b0:605:e0eb:d3d6 with SMTP id
 g22-20020a9d6b16000000b00605e0ebd3d6mr8263208otp.213.1651708440302; Wed, 04
 May 2022 16:54:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6802:1a9:0:0:0:0 with HTTP; Wed, 4 May 2022 16:53:59
 -0700 (PDT)
Reply-To: ortegainvestmmentforrealinvest@gmail.com
From:   Info <joybhector64@gmail.com>
Date:   Thu, 5 May 2022 05:23:59 +0530
Message-ID: <CAP7KLYgH9LcKHS-KgR0zObHAgC6Fr3D+dOJSbDKurTc_12+iFw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b43 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5004]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [joybhector64[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [joybhector64[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
I am an investor. I came from the USA and I have many investments all
over the world.

I want you to partner with me to invest in your country I am into many
investment such as real Estate or buying of properties i can also
invest money in any of existing business with equity royalty or by %
percentage so on,
Warm regards
