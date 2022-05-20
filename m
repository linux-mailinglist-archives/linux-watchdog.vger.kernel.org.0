Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A8D52EEAE
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 17:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbiETPGy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 11:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345608AbiETPGx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 11:06:53 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12145DD07
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 08:06:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id c12so11136915eds.10
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=lRRp9ySnP4trb+Nzm/pVcHj8+MaHvoUJ4VMngtFnkb67ZqgWQ8EAQ0UHRniTfO1D1p
         dC+tMKJtuBYaKCJa8NjyFMBSaIbFvZwnqIyI8PW+rKGjAO8nh6BKlROyMLIjeoB4kSSx
         FWEYSEoaAthPV2u+BuR3QiSECbfbrPukpG76+hKDcbgkIE0Slgyab//U4OX/rmwSLsee
         ZzIl8ZvN2KGy7N64IoFQpjN4J+bb0Am3z4un1SZ5ApDGbtC5pBFX0LVzZAp7K787uP1k
         Du30MZrHInDJKaDBk6bhnndhXsdZxfj/u47te9+iNU32CEJSN19FaTmUyV9SksXzaxxT
         f5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=gboX7f2uI9IEji7WOPEVzdD3+vV1TnWOdisiOdfDVMRK+dtWPo/lLe02y8R09FyeeN
         SFuAF9n3OI6ECWXVnDInVQT2MiT3sLfFrnI8Fpjh5WSa90wxCE6jNShpvBc/I/TYjK7O
         XjjPGTy4UwhZex37cL78osJZ9DJ7pZZuCr4ATG/QlmGbHNmMjQeWSNKcUJR4O9g6HwFM
         yldd7tSHtJdoDHH1vSQ83XgaLMKQoDWYzmepDok4OHuBdQnWH27Y/cs+DBsXkcpqytUJ
         FsD+n8H1rjbP2uCiZhD4+ICGwvG/ittrw7dJb8NnLSncG/vH1S2sb6qVFa9T4Z+5stxV
         5xcQ==
X-Gm-Message-State: AOAM533n60Vwf6YAPBrZ3R0KTXbizeFhhQg59PtQXToSqiI4kgo3CUMw
        sUz08WzC7jnRMu2tStdUSl2wivfQg16eWX3gUSY=
X-Google-Smtp-Source: ABdhPJwhRxYeSIzHaKT4yQa8QB6yFu3wWocagNCkwNgDk0PVBzpXPzWHvoATVd4jsbrKZvmKCsr6gLRU4Q5pP2Pc47U=
X-Received: by 2002:a05:6402:50d1:b0:42b:c3e:d71e with SMTP id
 h17-20020a05640250d100b0042b0c3ed71emr6904951edb.144.1653059211226; Fri, 20
 May 2022 08:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:6cc7:0:0:0:0:0 with HTTP; Fri, 20 May 2022 08:06:50
 -0700 (PDT)
Reply-To: illuminatifame157@gmail.com
From:   illuminati <idrisadamu2029@gmail.com>
Date:   Fri, 20 May 2022 08:06:50 -0700
Message-ID: <CAKn-HL1GgP1ziG_im3uRHgiH=Q5vPA8vR-JJTritHe=x1OZjkg@mail.gmail.com>
Subject: illuminati
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:542 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [idrisadamu2029[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [idrisadamu2029[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatifame157[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
WILLKOMMEN BEI DER ILLUMINATI BROTHERHOOD ORGANISATION, einem Club der
Reichen und Ber=C3=BChmten, ist die =C3=A4lteste und gr=C3=B6=C3=9Fte Brude=
rschaft der
Welt und besteht aus 3 Millionen Mitgliedern. Wir sind eine gro=C3=9Fe
Familie unter einem Vater, der das h=C3=B6chste Wesen ist. GOTT
. Ich glaube, wir alle haben einen Traum, einen Traum, etwas Gro=C3=9Fes im
Leben zu werden, so viele Menschen sterben heute, ohne ihre Tr=C3=A4ume zu
verwirklichen. Einige von uns sind dazu bestimmt, Pr=C3=A4sident unserer
verschiedenen L=C3=A4nder zu werden oder zu werden. einer der weltbesten
Musiker, Fu=C3=9Fballer, Politiker, Gesch=C3=A4ftsmann, Komiker oder ein He=
lfer
f=C3=BCr andere Menschen zu sein, die in Not sind E.T.C. M=C3=B6chten Sie
Mitglied dieser gro=C3=9Fartigen Organisation werden und Ihren ersten
Vorteil von 1.000.000 Euro erhalten? Wenn JA, antworten Sie bitte auf
diese E-Mail: illuminatifame157@gmail.com oder WhatsApp the great
Grandmaster mit +12312246136
