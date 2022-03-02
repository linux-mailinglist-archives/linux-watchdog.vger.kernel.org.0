Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A764CAB55
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Mar 2022 18:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbiCBRQh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Mar 2022 12:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbiCBRQh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Mar 2022 12:16:37 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3EE5BE48
        for <linux-watchdog@vger.kernel.org>; Wed,  2 Mar 2022 09:15:53 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id x5so3177872edd.11
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Mar 2022 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=8Rhu8v8PuXlaQSFqlGPq8IPcwtigy+vuuGMlEuv+bJo=;
        b=jvpx4ZrqkV5jo36VbBTfONr+ER9h4X6zRm3Kq5vrkB+qYoNHe1FGN6kZDzlFIZJeri
         /jXHf4m6qtuZxzgRWKZMq7ZyCv5RnO1pysVCs+Rs3q7sZlnOT3Ytnsg9LrxJDCYIEGTD
         I/ejMN5UM3uP/+2weRiRT+YUlcbsSS1sYSLFSoHHggLxXBHjZKHZDaKDOWSpuGRmjSnl
         I4xpizNXCAaVw+1BZu1T7SA0aU/9awwUb5AdI9ag0xB3LvqLWaNhqZA8/zTmjBtV1Au+
         qF/1uEX7ZfRJg+zg+tuh6Htms1dQXAIsui6LbM/ABPXEKpigH2E7xHGZ5dglU/c9Wr1O
         K55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=8Rhu8v8PuXlaQSFqlGPq8IPcwtigy+vuuGMlEuv+bJo=;
        b=rPhXNZu90/Z2SVeFzjJxTzP6JFKgi8SZYWlxmTt6AoX3i3j4iYCAtNPKk7OckH5q3A
         J9K0EfF6zH3liz0VxPIRriKPJ1U4UnhdpgSuXaGEqgJaiu31siveMi739MhG8nsr/IHU
         kulyZYp2fh57PEaJQQbTwZeshdf1gaSTIMaCZKQ9S2SmmTXoiLfYYZ+A5AUTAzrBEv3g
         AStlKw3LKHkUJTQCV74Ku5+PQ8uAgIDDwXv8Zb2B2/73TbY6hf0gzLcAQSW5fLgt4Cl8
         S0IqHtHVxlEpnS3pSZcmMcqjkWh5SlIjOtL6eVMdWoqTStcCIYaPdyoW20mEOWrEyQLJ
         qDQw==
X-Gm-Message-State: AOAM531p+CdNTw8/A5mheYeudieK+aUdLPzr5WJkjRKg2h9qJ5dzUL7k
        H5IIKXecQa8kbubrPuxSjrTEPkkO/PbEtqXktXs=
X-Google-Smtp-Source: ABdhPJxr6lahJL46GD+lfabO4AZBm/4qS+QtrGb32SX+ygFm8wirAx2y3FFcrjpIG9Y2smbwEsKXQdnDgidI7Xaw5ec=
X-Received: by 2002:a05:6402:5109:b0:412:eb8d:cbd5 with SMTP id
 m9-20020a056402510900b00412eb8dcbd5mr30680619edd.290.1646241351950; Wed, 02
 Mar 2022 09:15:51 -0800 (PST)
MIME-Version: 1.0
Sender: judenkuma10@gmail.com
Received: by 2002:a50:d619:0:0:0:0:0 with HTTP; Wed, 2 Mar 2022 09:15:51 -0800 (PST)
From:   "helen.carlsen" <helen.carlsen26@gmail.com>
Date:   Wed, 2 Mar 2022 18:15:51 +0100
X-Google-Sender-Auth: thsjSlv-ZjwSDIenIKQUXB_IrJA
Message-ID: <CAP=Po6epRc9O2Eemf3cw06s1eXEFSyN3Y=3VSDNcP+QL19P1EA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:536 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [judenkuma10[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [helen.carlsen26[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dearest One,

    I sent this mail praying it will found you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. am Mrs.Helen John carlsen, wife of late Mr John carlsen, a
widow suffering from long time illness. I have some funds I inherited
from my late husband, the sum of($ 11.000.000,eleven milliondollars)
my Doctor told me recently that I have serious sickness which is
cancer problem. What disturbs me most is my stroke sickness. Having
known my condition, I decided to donate this fund to a good person
that will utilize it the way i am going to instruct herein. I need a
very honest and God fearing person who can claim this money and use it
for Charity works, for orphanages, widows and also build schools for
less privileges that will be named after my late husband if possible
and to promote the word of God and the effort that the house of God is
maintained.

I do not want a situation where this money will be used in an ungodly
manner. That's why am taking this decision. am not afraid of death so
I know where am going. I accept this decision because I do not have
any child who will inherit this money after I die. Please I want your
sincerely and urgent answer to know if you will be able to execute
this project, and I will give you more information on how the fund
will be transferred to your bank account. am waiting for your reply.

Best Regards,
Mrs.Helen John carlsen,
