Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BF86980D6
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 Feb 2023 17:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjBOQ2l (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 Feb 2023 11:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBOQ2k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 Feb 2023 11:28:40 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885BE3A87E
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Feb 2023 08:28:39 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id u20so4484603vsp.5
        for <linux-watchdog@vger.kernel.org>; Wed, 15 Feb 2023 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oO8hkORiN8JKXRDFOfqPRT7kNqjSH0a2pZ6yQvm+cU=;
        b=WU6Jcic+YqPZCjb7OQBrZCtOk/FLYBQYuGPzdeYUR30NkvsJXFjpLb3aUfZzeSa20z
         oBcV5dy+8fZFTiRqlNXUWzpD+6VlFNiQ3whupR+/BjiL1JliXRGMt3EzjWopm55UU//X
         3zjQh2qneBy7GNepTkP7H/AZVBIINXAShWGWt+jiv/q22memTiPzbhZj3dhaKDQlLHmh
         N2OlDalxWs/ooPHmPcF9y34UO9jayNb8yNtCzxgcW/teEIV4ek/afbog8bB0aYcLyv5i
         pxHTsuJQ9YudRWCKOxsBhkUAX3slFDZRQdzJ8X0mYqNhj8FnCwsEzQrLilYj0kpbFMA6
         DfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oO8hkORiN8JKXRDFOfqPRT7kNqjSH0a2pZ6yQvm+cU=;
        b=NzhWaoZJS3chrbzTtq1kcDZ6K7ZsnytPXqFWY8VNLU5TenmrmkHLpHZgkzLoBSEXhz
         9q6Y9CGWvGr2hGo7zb5mlNVuJErIHB2HEZawTLM+FyNRx5tPb0+mrYVPtezKelpmEVVT
         Xun0lLf+1xUpkMfpcV82jQSouFdTcVY9cs90kf+0ngQ65MN93bRDqr0j7pocvXur/V0+
         X9QRc7IvXoYHPnOR87TOnZRvVbCEaDTMKo52cYh/rJcGfqZhG/DRa2NhvsvOBVW6KPMp
         vQLaQ6UehtzdEJVvKZuaMkn8PiQzvQcJjScVEAeI0oWrfDKyV+JLtH6WWp+tWrs0vGIW
         4ZhA==
X-Gm-Message-State: AO0yUKU8gUePe0J4ldkVVEuZ7lFKPlYCAC/zs6WV+QDkPT173LPYgDez
        gJpmJZd5YPGEgwkONVj2uEBFtXJD9y5NWPMf6qU=
X-Google-Smtp-Source: AK7set+0LAflIVYSq897nS2z/93p0CsDWS4BJxf40ygKYGjvIqOKf2FDV9SmEpNlHFV1Ha6uZAyeaqvHhDciftm5eBo=
X-Received: by 2002:a67:e958:0:b0:3cb:8fdb:d7d6 with SMTP id
 p24-20020a67e958000000b003cb8fdbd7d6mr523154vso.31.1676478518647; Wed, 15 Feb
 2023 08:28:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:d852:0:b0:399:4b59:efdd with HTTP; Wed, 15 Feb 2023
 08:28:38 -0800 (PST)
Reply-To: thomasjoycetho12@gmail.com
From:   Joyce Thomas <budejohn2@gmail.com>
Date:   Wed, 15 Feb 2023 08:28:38 -0800
Message-ID: <CANhjusdE-DM68yyMbhdM6q2cpyKLRMJnHAKOT52j4yqb_ZzkUQ@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5027]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2b listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [thomasjoycetho12[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [budejohn2[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [budejohn2[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Good morning,
Please confirm if this email address is active? I sent you a message
earlier, did you get it? Kindly get back to me.
best regards
Ms. Joyce
