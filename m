Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309105B256E
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Sep 2022 20:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiIHSPC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Sep 2022 14:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbiIHSO6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Sep 2022 14:14:58 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D0024963
        for <linux-watchdog@vger.kernel.org>; Thu,  8 Sep 2022 11:14:56 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso2403328wmc.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Sep 2022 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=HH6zS8LbY0yCvFJ/ANUVrGBEoPAwnW+ESl7L8PwRUvk=;
        b=hl1e5cRyHUD1UWaTfj5oiP7KwVxXuzFjPuhfQpG7ExvZWTGM4TNPU9NuBx+t4EcAAj
         3O574+DPT/y3c4TdnqOMThKHzbnHluN6EmuOt2fwjd9mMzv2cxeJG0bRjEHdgftkEkgv
         ya96SALY98sE5hl/RXbxrykl6XWqqlZSZogFtWRcdUFd5A6HUs3EtUJTyKNHiCnhSMBg
         hPjaUdYTX6GKzXKYPjw/0L3n0idspwPhuMnLlSdiuT1ZmZJodRttVW67ZD6s5vkFpKLt
         XT1zWFE9qV6v21OKtR9wSXnjSjj5BDQnJIP94hLuyIYMh0N3jnDd6Vn2tGyw6dTmxhJ0
         JPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=HH6zS8LbY0yCvFJ/ANUVrGBEoPAwnW+ESl7L8PwRUvk=;
        b=MMu7vmej9S5cSmKnjGBwElEJMGD3g1oE4KYP6NMC16metUJZpmVYMJOnrb1jSvPM+I
         Lxtmy0hWhDYLABsySSKduCAY0QnwSBOfwUoGLWiV9hsDGTEC8YipbWdYZ65WW/K8FsUY
         XqF8AV+JABeb1YFu8s+DPHCGRau0R6bSTv4dEp87ZRwLifzHMo19LvNYjKCJ+q5GRKPA
         bZDEYnMwbIztwHowIO0UJUCWoaQ5EJGTT5+yI9hnzgRouHp5IwjAFjmmJ7HAq1cF3ufQ
         BT7vcaJO2ZCBin9+lNUcCJ5D5/SZ/cR80TQcz0LVyw9gKtnMo4d/W9wgkRDm92ZNqent
         izmA==
X-Gm-Message-State: ACgBeo1C3WKsHTR7sWPQYF+Lacwc6VGZw/TE20czwlHpEOu6yoweQ06o
        KrYeWKkVIREAiAHHYjc1QYvvA3fQGX5lSrFn0lXtMMmXUe0=
X-Google-Smtp-Source: AA6agR5QMLfX8HHGYg4D3mBLb65PhLIlRNUwXCZB+8WeAGnF9j/4QJFrwu7E35+NwJR+2gyXp4NNQPdRvflvn8X7XFY=
X-Received: by 2002:a05:600c:4e4b:b0:3a5:d36e:8349 with SMTP id
 e11-20020a05600c4e4b00b003a5d36e8349mr3226805wmq.44.1662660894464; Thu, 08
 Sep 2022 11:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:ffc9:0:0:0:0:0 with HTTP; Thu, 8 Sep 2022 11:14:54 -0700 (PDT)
Reply-To: proctorjulius@yahoo.com
From:   Julius Proctor <walkerjessica335@gmail.com>
Date:   Thu, 8 Sep 2022 18:14:54 +0000
Message-ID: <CAG5ZJ158sg6xoGH=R6wjDPCxBjPy6RdPMiqzpN8hemmTkLeeTg@mail.gmail.com>
Subject: =?UTF-8?Q?Gr=C3=BC=C3=9Fe=21_Ich_warte_auf_Antwort=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:32d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [walkerjessica335[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [walkerjessica335[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Guten Tag

Ich bin Julius Proctor, Anwalt der Anwaltskanzlei Proctor. Ich habe
Sie bez=C3=BCglich des Nachlasses des verstorbenen Dr. Edwin in H=C3=B6he v=
on
8,5 Millionen Dollar kontaktiert, der auf Ihr Konto zur=C3=BCckgef=C3=BChrt
werden soll. Dar=C3=BCber hinaus m=C3=B6chte ich, dass Sie bei dieser
Transaktion vertraulich antworten.

Julius Proctor
