Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B2F62D091
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Nov 2022 02:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239176AbiKQBW3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Nov 2022 20:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbiKQBWK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Nov 2022 20:22:10 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A83E4D5F0
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Nov 2022 17:22:09 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so1473975ejc.4
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Nov 2022 17:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+TUOsPnDycx17yT5y3SaYxN2lSmtxkJKGL2zeQTOy8=;
        b=PlKRcrIN7gMSd1vyDgU4xB/mMXpPhS5DXI4OJ3gTYnXfMmwl0goxur0WXyGCbyhi4J
         Ew3jdkRFZKhu2AM0OFX5LRVuT5W9plSE69fEAFpLR/nbUMNmkApOuCEqgjpqfviz0G7K
         9XssA/ox/lDnp5uo0Q3rWzk1bgNBI2Tw8Pzcepnthc+qyyV35VKVo8zfgumHX8kHOtL7
         4mMubdg9/GC3r3dZlWuwVCimI5JrKT9h8AqSjztsvckUHj/pi5miAAT2xY4Zg3tCJmQK
         2nNytbT34BivXG1A40se7kZRs95yH1vpl+1/K8wHayTCbv4uWfk5P8tVytV6gS/OOCNA
         GOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+TUOsPnDycx17yT5y3SaYxN2lSmtxkJKGL2zeQTOy8=;
        b=gaeltrzZ7aviRo1vYVN2r0/Q1NAHTHp0aL1fdyH+gsrXd+V4X55txRZu1/8/86KiFC
         tlQXEJiwk36j7rdptre7wmiyimqtV/hqulIEJFOSLxQd2xyYYgljAZ6j8onc3AQu3G9z
         Hm6wHIUcyW4ao/R+5aFEdImnPDNHeGX6XYXDXGwoPA68C20KnpQ66vePYgY6alQLGvfQ
         uW5fpuXsmH/X/bLSjygreyzO/belHHpOvntMvzqIeJrAoFTHF6xEF/O38fZLUbYAZqCt
         z7IBTb5V8C5dsfMB65uMs/ZRkW8u7vJOCKvuwz+DJKF+wBa/ibUYTqfEk3BMqOwWQzkq
         mejg==
X-Gm-Message-State: ANoB5pm+6LhcN+bOR3JSUMDvrSXm0jBshDMzAPYy30B+R1GNZjnM9kCW
        0NXhpTM8V5hcOaRo4e0ivtcoZabqz9I2AlRVg0k=
X-Google-Smtp-Source: AA0mqf7hQf3pay2+FLT+3OxEi8fQ88GfLd3q/15dRu3OnZMsf389ZlUqOG/V+bSiSQzLV89jRUDsgn8birN+OOWIzL0=
X-Received: by 2002:a17:906:2804:b0:78d:e7c0:a2b with SMTP id
 r4-20020a170906280400b0078de7c00a2bmr355492ejc.273.1668648126444; Wed, 16 Nov
 2022 17:22:06 -0800 (PST)
MIME-Version: 1.0
Sender: singakathadeus@gmail.com
Received: by 2002:a98:8d58:0:b0:180:d3f1:d92 with HTTP; Wed, 16 Nov 2022
 17:22:05 -0800 (PST)
From:   Richard Wahl <richardwahl947@gmail.com>
Date:   Wed, 16 Nov 2022 17:22:05 -0800
X-Google-Sender-Auth: HissmjzFVP50CKXgbdanxeErBMI
Message-ID: <CAFGaFrVYDOJaB1432+rp2YQCHhHk=0w=9+8uZkwy_OzYYir39g@mail.gmail.com>
Subject: 1.200.000 Euro werden Ihnen zugesprochen
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Gute Nachrichten,

Es wird erwartet, dass Sie Ihren Preis in K=C3=BCrze einl=C3=B6sen. Ich bin
"Herr Richard Wahl". Ich habe in der Power Ball-Lotterie ein Verm=C3=B6gen
gewonnen und spende einen Teil davon an zehn
Wohlt=C3=A4tigkeitsorganisationen und zehn gl=C3=BCckliche Menschen. Zum Gl=
=C3=BCck
stehen Sie auf meiner Liste, um dieses freiwillige Spendenangebot zu
erhalten. Antworten Sie jetzt f=C3=BCr weitere Informationen
