Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0421C620ED4
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Nov 2022 12:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbiKHLYK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 8 Nov 2022 06:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiKHLYG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 8 Nov 2022 06:24:06 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8FA31DDF
        for <linux-watchdog@vger.kernel.org>; Tue,  8 Nov 2022 03:24:00 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id q21so8296219iod.4
        for <linux-watchdog@vger.kernel.org>; Tue, 08 Nov 2022 03:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5B7dfi7xVJ3OslQ0ALi00lhJojz9IHhiYsVHA/RHqOE=;
        b=Z2xz0F62PYjCBDaPJAMQlwAdSUUQxdVmjdSE1e/TEz5D6nfB7qYhDRauEt75dK7gsB
         gtVoTdjw0oTaDS+z3idasRk9nIwydmI3O/a8UQatcsDJqkbGbIVyT1SuNX1kSLffYta+
         MRaPM04Hv5NGx1PX+KL+YO7lfN7BHKCLYUZEhYaO6bT3eGqzCEeqoQdWOoaKJxxIWVcR
         X5vaz/veLMrOj/9U4MKzAbNWDLkTVcyykPfCiQUtOALLeK724DexTS9gS8OIc8PPRbY4
         YNmg+MP12x4a8uFh/63hJCJOP6eBt/pwec9yaAniUfCEq02k0DzqkBqfTrX2eYh/P4iT
         mINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5B7dfi7xVJ3OslQ0ALi00lhJojz9IHhiYsVHA/RHqOE=;
        b=ZA3kej053ZcdfOidoefFB+V6flomLyFBTWBM7H2Io2PiYzw6K6xCPYloHuGOQQ3M75
         pwSF+UXgoVV/3DVKX4KK/nSVi55UJTPsuw0Y484s8P92uFBuonhO5rPcYWDzhZLmYtAT
         VqnfBUUr12Xy0RvJQdb4baxtl+29cT8X01Ev8EPu2UUSTaRE0zHt9Uy3vRG5o59hOlT4
         Te4b7pRofBdCq+KUmjy+bOxv8gcObXjnxloD+i8SoYevBYASk1AQU4LxQZ14mXoDNCX9
         LhGfpgkbX7q9k5k1Dr5Ei6V7Qv4kOhvZ0MNLuUpeecZIKQirnqKlIO4jsIRBTVzMfITO
         XXLg==
X-Gm-Message-State: ACrzQf1DmW2UipVU12IjxmWrXhOwA7yAfLWxVY85hAdC2xYgKdeqZalf
        70slnYQG6jJ+nF3u3C1DHMIMNZvE3VUN6UHYOpI=
X-Google-Smtp-Source: AMsMyM5kag4nOyXiv058CAI4vKxtxp06JiPON4WELDl5Ot316dAXYP1rZp27aB4pLGdFMhJREf8MTcDs+CaUCGO8K58=
X-Received: by 2002:a05:6602:2b06:b0:67f:fdf6:ffc2 with SMTP id
 p6-20020a0566022b0600b0067ffdf6ffc2mr34602043iov.111.1667906639638; Tue, 08
 Nov 2022 03:23:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6638:1921:0:0:0:0 with HTTP; Tue, 8 Nov 2022 03:23:59
 -0800 (PST)
Reply-To: mrinvest1010@gmail.com
From:   "K. A. Mr. Kairi" <ctocik10@gmail.com>
Date:   Tue, 8 Nov 2022 03:23:59 -0800
Message-ID: <CAEbPynvH+BZ99HK-COU1=n6MNs96giewbsO80XYSawcxKUtHrA@mail.gmail.com>
Subject: Re: My Response..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrinvest1010[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ctocik10[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ctocik10[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

-- 
Dear

How are you, I have a serious client, whom will be interested to
invest in your country, I got your Details through the Investment
Network and world Global Business directory.

Let me know if you are interested for more details.....

Sincerely,
Mr. Kairi Andrew
