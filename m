Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B944EB5EF
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Mar 2022 00:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237342AbiC2Wbg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Mar 2022 18:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237306AbiC2Wbb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Mar 2022 18:31:31 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEEF6A033;
        Tue, 29 Mar 2022 15:29:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so2365938wme.2;
        Tue, 29 Mar 2022 15:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=Ig8qBaP+s0wZj3Yzj/Jok4qUQy3Qe6lbCeKCwjh1Dmktwg+4b2vgKmwE40mMrSK1pl
         BJw5HJmfGifDe6MBDwnrt8z5KFWpO3lr7HlF2R5Ej+n1AH2FwrVkKqj/ZFwx3PTdSXdQ
         W0Cxl98ibySSZFvLakO0ll5eDx2YeXiztr9OUQ/ic87+Aps89WWzf884CObUqzgDVNA+
         Wdh/qmswR3+MZ6brz7lQdij4Y6E69QJR5rkpgLZ8OxngLR9JASm7p6UT5AhRcq74t4Pe
         /bUfMqvVwO/0q2q5wSZq29cgGJnxO4mIApq085bb/NnyY/1//5z8c05IA0O6RcyINN5w
         Pg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=lKLX5u58LkA9MNtEcL8v8x/G6rQ5eB2vjvBW7Ml2AVeD+YwnU7EfSbYc6QgYhUBAn8
         pA8KzXFJE/xwtGJ/rgEtMa8hTGkHMeowFyEpOdwCmBeRraY2JNqaPQRaWPyQG25zUKzC
         ym6hHnZHw6CDUdvPuC4ojwY+mog56cWcbqoxygIgwn4bc+b69bI5MGAuV4bnCJTE6m58
         2uTOyxaRUjw3KPmtBHELMjiTQSSlCeheKLv5dtd4qV4NFm4vW+ravWXwyJZ6I4ayiyhZ
         GY12PIifZZ5M1gqqmVn/I8gQMXC5dMvfpIZPFyF3jIPqVLDP5vWjansK2O3VIEXhYx2E
         VL1A==
X-Gm-Message-State: AOAM531DYpdq6bmS1ypVuNTmhJI3/MVko2/w3qn4lw9vXocJpBhiwA57
        g85q627xz/jB2bI8yM+xEpo=
X-Google-Smtp-Source: ABdhPJxjd3go56sj6cXZylYmZZ9zN0+O8erzuqsWpdkf+xnwJ6lzfh4D7+1C5lRvgrosaNBz4tEBHQ==
X-Received: by 2002:a1c:f607:0:b0:381:1db:d767 with SMTP id w7-20020a1cf607000000b0038101dbd767mr1501727wmc.165.1648592985783;
        Tue, 29 Mar 2022 15:29:45 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.27])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d6612000000b00203fbd39059sm16004923wru.42.2022.03.29.15.29.40
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:29:45 -0700 (PDT)
Message-ID: <62438859.1c69fb81.4d4fe.f2d5@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:29:34 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
