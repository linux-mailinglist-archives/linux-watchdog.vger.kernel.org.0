Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432A8632604
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Nov 2022 15:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiKUOgp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Nov 2022 09:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbiKUOg3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Nov 2022 09:36:29 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D9EC78F3
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Nov 2022 06:36:17 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3a3961f8659so23357677b3.2
        for <linux-watchdog@vger.kernel.org>; Mon, 21 Nov 2022 06:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YzgGX4AwSt860hhHaRgKsA8hx2m0I67dk0IZRTCbtjk=;
        b=ibjOL8GKIlYfStrDTd1SYVU7iDAbtLTmLVOHXwTtJ7rpEqZTaa8HxDSiXldOyskwZV
         2x2fr3e4jaHNCNi8IrnlbicG+TFmN+jusNfea6xfodHs1hPll1htfHNWGvd+2MDd8JrT
         i+IZrXoI+7/5vs244X+ISRvhejicYiNUAm0Tbbuf+aNLZuqPpmLYcBVZXXyVVQTsHnx9
         E5lBwlpMzImWh7bYIC/kiDTu31FsY9+fX6gc80i0KUrkOiCygVUM3sgzYd8Y5TMQtn3S
         8LXs1q7XQ4kwsN4jcOHyqUfPbCrDjhEzLKKcxZsLFaLoUzP4wYktkXqWtIWHgvVPsPDw
         ziTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzgGX4AwSt860hhHaRgKsA8hx2m0I67dk0IZRTCbtjk=;
        b=drZWfvtwnu8pFi9Btjj78KwqpuJS36QK69PYAtVdS8grCr+HTC0bEFBm7blqQLc24n
         s6P+qHDRzUQUX17Uf9fD0OZ49YdgZzVWBuEZTwjeref4m7Ta11wH2+DvxW6tUu7ISxFB
         rhIESzqaB0+VyUywfKy3cYekpMuAYFEnxejmlLqv4rKRkO3n08oV+ELWGvjEo8Kg2sUS
         6R3YHkqGbuGj5aq0ESLv3l+Z5VbFa0SH2WJYu3W/sp/3tp+fU5UsjlIOgcp3jyPnmhQW
         dqB53IMTwY+Q8flcYZSPxDGW+usU72mJyksDT/ymvvhQDLnhw0O5Pi3yqqukAhvoBpuE
         D13g==
X-Gm-Message-State: ANoB5pkw6HruBjKWDR+kf7KfmIxGMS82IU26fdWkoeMNd1cbaJJJXuC+
        j2pK5dJ+tqW/jigVvY74Je0Z7+jlIKTM4WtuV5Q=
X-Google-Smtp-Source: AA0mqf6GqBzxXp3wQkoZoMIIFGNDzygSYw7CLJAUiwC3NgNZP22VqqOaaGsFzS5f6xMUwpFCQpsiWivq5o4qkkarpg0=
X-Received: by 2002:a05:690c:b96:b0:35f:a643:f200 with SMTP id
 ck22-20020a05690c0b9600b0035fa643f200mr17416298ywb.70.1669041376420; Mon, 21
 Nov 2022 06:36:16 -0800 (PST)
MIME-Version: 1.0
Sender: hc987479@gmail.com
Received: by 2002:a05:7010:8e1e:b0:313:94fd:3f07 with HTTP; Mon, 21 Nov 2022
 06:36:16 -0800 (PST)
From:   Richard Wahl <richardwahlll17@gmail.com>
Date:   Mon, 21 Nov 2022 14:36:16 +0000
X-Google-Sender-Auth: _c-UPCnEObfhKaXBDGDhxtYfjVg
Message-ID: <CAHfQ0GtrEPnyBG3j9AWigSOT33CU+Njx10Caw_fJxkQF1SjC0g@mail.gmail.com>
Subject: =?UTF-8?Q?Sie_haben_eine_Spende_von_=E2=82=AC_1=2E200=2E000=2C00?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Hallo. Ihre E-Mail wurde f=C3=BCr eine Spende in einer bestimmten H=C3=B6he
vergeben. Antworten Sie mit Ihrem Namen und Ihrer Adresse,
Telefonnummer, um Ihnen dieses Geld zukommen zu lassen.

 Ignorieren Sie diese Nachricht nicht, da sie direkt an Sie gerichtet ist.

Rigards
Richard Wahl
