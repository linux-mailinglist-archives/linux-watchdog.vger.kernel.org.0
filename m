Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFAF4F2290
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Apr 2022 07:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiDEFZg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Apr 2022 01:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiDEFZe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Apr 2022 01:25:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FE2B48
        for <linux-watchdog@vger.kernel.org>; Mon,  4 Apr 2022 22:23:36 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j12so9919853wrb.5
        for <linux-watchdog@vger.kernel.org>; Mon, 04 Apr 2022 22:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QdNR0NwRIA/CFUiggiA/1HbZw49x+sDDr/p707xp4Qk=;
        b=GkYO7gsuukfRFRT8+lPiF5D+MATNkuJUF3TKSWHpWsk/Z/EZ9Hj4Jps7s85I4mPko1
         TY2OVA1g+2YRuyKKMnsRxh3lq9mVtURNoC25ZCHsgPAuwvnnkU2GPssKMmySACvritgl
         PMdM+ThcY3hrlXJ6op6L2H8fuWDjbxiP5xLNuI31kG9mvRFxSVVwZqmiztsW72PJyapQ
         GOSGhwamNUNgmhmuQc4KvoQISbU+yRoPptYNnAguI8OOmaz616Hu1dTJBjxDnen6DlEs
         eBZpm5w7Yg/WXvXK+i+GsKY8JmGi5Z6o8fu6Eu7oj3MuAf6R8Fc+e/5rvsfmejfiuB0U
         Ud6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QdNR0NwRIA/CFUiggiA/1HbZw49x+sDDr/p707xp4Qk=;
        b=Vj6Fq5PRFFx/bUgb4hY4yjSFCE9A4RjnVyTXS7Bhzvaq+G4/QQhAYWd2P3y5+CuQsT
         /b9p3R/huZlPyuhNXO/83bqEl/ssViHkdFjK8yxDDgL+CKK6mM0iLu5W3V2nt73dYB86
         q/BWyk3L44EN7xDYAkViCAsrlcW5KE7aUro6KxA8g7h2765hYaCMsNBQ0jOwhskYhv+M
         NDInhJ6l2iT9hMeWSijrjNmxpb/judG7f0HzhibHlvBlzWGEUgY0315meELAwYXAe5GH
         VHxsyh6Ji1w0cL0sOV6LbIvuPjnvEEgfsYGAXg3ZgUkI43GuPbPC5EkSx9axyV1h7pSi
         NrWQ==
X-Gm-Message-State: AOAM530OMayys6CVJda27rfk9N1LX1MLzeT5kMzCbveeSglHw93ks1HG
        b6lKDYiJ0FMfPwRcoVvTzyiHx/PZk4FjrxXFrkw=
X-Google-Smtp-Source: ABdhPJwwrxzNrg6ya2D51aYC//6ORFlHUEgVi9qnLxedAeatGXvKLNHb/CPUDmQH6qJnVn27kc2aFXzdlAMaOARAyeA=
X-Received: by 2002:a5d:5987:0:b0:204:1f21:6a29 with SMTP id
 n7-20020a5d5987000000b002041f216a29mr1219247wri.716.1649136214635; Mon, 04
 Apr 2022 22:23:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6020:aa0e:b0:1b8:1c2b:a9df with HTTP; Mon, 4 Apr 2022
 22:23:34 -0700 (PDT)
Reply-To: illuminati.br252@gmail.com
From:   ILLUMINATI <maduissa2@gmail.com>
Date:   Tue, 5 Apr 2022 06:23:34 +0100
Message-ID: <CANoxgrUhn26JfUpOfqkZa9MzwPPzma2AzYaE-uxyzUgkkg-hPA@mail.gmail.com>
Subject: ILLUMINATEN
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:444 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminati.br252[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [maduissa2[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [maduissa2[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Hallo, wie geht es dir?

Mein Name ist Herr Harald Dalibor, ich komme aus Ratzeburg und bin
Mitglied dieser gro=C3=9Fartigen Illuminati-Bruderschaft. Es wurde unter
den Prinzipien von Liebe, Gerechtigkeit, Einheit, Frieden und
Erleichterung gegr=C3=BCndet. Lassen Sie sich von Ihrer Einladung nicht
verwirren, ich wurde direkt aus Ratzeburg zur Rekrutierung geschickt,
da die Illuminaten ein Interesse an Ihnen sehen. Sie wurden
ausgew=C3=A4hlt, weil die Illuminaten in Ihnen einen sehr wohlhabenden
Menschen sehen, Sie werden derjenige sein, der Menschen in Not hilft,
die Obdachlosen werden sich an Ihnen erfreuen, Sie werden die Armen
mit Hilfe der Illuminaten ern=C3=A4hren, wir k=C3=B6nnen Ihr Gesch=C3=A4ft =
in Gang
bringen und Wir k=C3=B6nnen Ihnen jede gew=C3=BCnschte Position an Ihrem
Arbeitsplatz geben oder bei allem, was Sie tun, kreativ sein, und die
Illuminati-Bruderschaft bringt Menschen guten Willens zusammen,
unabh=C3=A4ngig von ihren Unterschieden und Hintergr=C3=BCnden, und macht d=
iese
guten M=C3=A4nner / Frauen in der Gesellschaft besser. M=C3=B6chten Sie ein
Mitglied der Illuminaten sein, um reich, ber=C3=BChmt, m=C3=A4chtig und
herausragend im Leben zu werden? Antworten Sie an die folgenden
Kontakte:
E-Mail: Illuminati.br252@gmail.com
WhatsApp: +49 179 5462698
