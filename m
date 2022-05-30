Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88AA538643
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 May 2022 18:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbiE3Qmf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 May 2022 12:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbiE3Qmd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 May 2022 12:42:33 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CBD1AD9C
        for <linux-watchdog@vger.kernel.org>; Mon, 30 May 2022 09:42:32 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v25so6204498eda.6
        for <linux-watchdog@vger.kernel.org>; Mon, 30 May 2022 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=bOahNYU9xxmxy03CP+auO1+vU0KvimBPvVo9M5a6W+w=;
        b=j4UKfbpuvHJ4eaiwyNn7spRQhUWDBWjXnKrxG8vv5uUDXcnXKXI0GHLjGqpZr/PMHD
         I0+b4QbXUJSpAGroQ/3h17/vTVRJLmcDUAmjlMkrZJCdSxVAIHDzdY3IZlmAtMqYoZUq
         Dc+rzC1eR5zb9p+9dkdaoTdSNDsLfGq8OPBbluvvuWa/16GQ/VTDRiA4hKeb2BaPsl/a
         68u+U147MCBki+eYgEEdwA27IxKMO1Oq8BxHQygi1sdacYGqbFPS/QtglgJi6vzakpaz
         1ofgArTmHszQBnYMNqb3xVdQeiA/WlOATwVJzcRK2Deay+VBOnk1CtC4vSV/DB7dpFxJ
         imJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=bOahNYU9xxmxy03CP+auO1+vU0KvimBPvVo9M5a6W+w=;
        b=EPVjS+lri2GMEK3L+NilGMUcUVKyW5XwqdpuMwVgPoiAbamENLQCLBpqLIfjOewBr6
         d9PVowEqnYVZRsEl/lnQ43W7qLjkmX9PUFW0oJ8V8afkPwsMCO6enuUxeQ13l9qwphYp
         db3WNvUxe6exXQ1xfj3z+sKOqDR7aLXJp9AmrRZ0Uzp/5Ic4ADp2ojoqTzL+GkUuOll5
         93W99Z9fumW8inWLphZlNm4c9SXoqjHP4POvQ9KVaMNPEhVEnHTxsL9mtFsI2IIdSMXR
         kTM0I2eKm2bADxAFLFfWv9/K5FEKZ2ghwSWOi3UzAFmL9Kf3TznUxru5M8CFU3g/kQY2
         KlKA==
X-Gm-Message-State: AOAM530z20I153S3h0b7eqMRDRbKipw6xbx0m+MvXigvIhxIJZjJdats
        Z7KSMN+zucOrhigU98zTx9Tktmv4Jdk0yv5cN2o=
X-Google-Smtp-Source: ABdhPJw8xOkwKQ/EsF6iesGED8fTYJ6a4vEmQaFWLuimO7s18UPDcjQnOFyPRd1Q6nagNEoHVwZ3b82sDnC3ncFaSnE=
X-Received: by 2002:a05:6402:51d0:b0:42b:b34:1cae with SMTP id
 r16-20020a05640251d000b0042b0b341caemr56078792edd.335.1653928950694; Mon, 30
 May 2022 09:42:30 -0700 (PDT)
MIME-Version: 1.0
Sender: oxfardkinz@gmail.com
Received: by 2002:a05:6408:25a8:b0:184:ca72:8bc3 with HTTP; Mon, 30 May 2022
 09:42:29 -0700 (PDT)
From:   Jackie Grayson <jackiegrayson08@gmail.com>
Date:   Mon, 30 May 2022 04:42:29 -1200
X-Google-Sender-Auth: UvgOMC-eCo-33t3sCYFF93hC8P0
Message-ID: <CANdM44=OR5Qd1PKN5SNd30h8yR4VR5SS1TbL+Ew17x7JmHAqFA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_60,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello my dear,

  I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life,I am Mrs,Grayson Jackie.a widow.I am suffering
from a long time brain tumor, It has defiled all forms of medical
treatment, and right now I have about a few months to leave, according
to medical experts.

   The situation has gotten complicated recently with my inability to
hear proper, am communicating with you with the help of the chief
nurse herein the hospital, from all indication my conditions is really
deteriorating and it is quite obvious that, according to my doctors
they have advised me that I may not live too long, Because this
illness has gotten to a very bad stage. I plead that you will not
expose or betray this trust and confidence that I am about to repose
on you for the mutual benefit of the orphans and the less privilege. I
have some funds I inherited from my late husband, the sum of
($11,500,000.00 Dollars).Having known my condition, I decided to
donate this fund to you believing that you will utilize it the way i
am going to instruct herein.

   I need you to assist me and reclaim this money and use it for
Charity works, for orphanages and gives justice and help to the poor,
needy and widows says The Lord." Jeremiah 22:15-16.=E2=80=9C and also build
schools for less privilege that will be named after my late husband if
possible and to promote the word of God and the effort that the house
of God is maintained. I do not want a situation where this money will
be used in an ungodly manner. That's why I'm taking this decision. I'm
not afraid of death, so I know where I'm going. I accept this decision
because I do not have any child who will inherit this money after I
die. Please I want your sincerely and urgent answer to know if you
will be able to execute this project for the glory of God, and I will
give you more information on how the fund will be transferred to your
bank account. May the grace, peace, love and the truth in the Word of
God be with you and all those that you love and care for.
I'm waiting for your immediate reply,
Best Regards.
Mrs,Grayson Jackie,
Writting From the hospital,
May God Bless you,
