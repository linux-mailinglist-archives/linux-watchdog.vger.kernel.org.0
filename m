Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5346581504
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jul 2022 16:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbiGZOVw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jul 2022 10:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbiGZOVv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Jul 2022 10:21:51 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F001415FFC
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Jul 2022 07:21:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ss3so26346094ejc.11
        for <linux-watchdog@vger.kernel.org>; Tue, 26 Jul 2022 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lLG88JCPgF7Yhflf4FNi4GQedsSNMbwmPtgneUr9Mu0=;
        b=qROVlOahP1/GrDITbQaQ786srtXVhgetCJwyVrBqZ0yys3z7MsVKvG4VIpvIoHamOC
         dQxkXEP+Yn5+jdI3q0xD7P/0OFfWciHdAaGconOD0l85s/rBtxirjWITyCCQDoQ8H2V2
         gLxkJVxQMKh+bRWL02V7EKTzqIpqdK3XRkUcDmGId1FRIjLIH7gEgBMpEKV6Wfv5Y/tZ
         6H5CJA2AkGbQ6RXbyt04vqnnMDhlk+oFIsivwICn/nVEagSgUhNdHcMyvqrVcpLjDC/+
         hyY2f+K0dtakIL5YB39L2UKVfrh7vRPhku3EJxTefzJAjx8O86skVXGwx+MUvUN/0Kht
         FZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=lLG88JCPgF7Yhflf4FNi4GQedsSNMbwmPtgneUr9Mu0=;
        b=EiLC958OIsT10s4JSSn3swbofZSaVlhazxF4DExkuaL0EeFeGWys1zyI4li2lsT4fe
         9rAw577Wxn0itgO0p9HvTArUT0zQAy35xOdXGlGyw5qITFJqbzKbeqJ8/e/DnYiRcMSh
         BtRxG8yJFhtS4rs7RP2JE7I2n59k9Zlgvvsiio/Qc2KiRNdzTWAIbnzEcO0Tx/g/ElYa
         Qb9AWYCjzTUHE4ovxAa3vyLiRXJFRJ5+8PxZUa23xKzE8L/PsDsC4v1BGZUfgIMwzjoF
         ngvHMuv4XjqQEID4CgLv2llB91r9PUtWDuAmY0tfEbhsADaTRf2qKubXcZJ340Qf6p8K
         SWlA==
X-Gm-Message-State: AJIora+qs9Kj/ZDGVfQspO2MWZ9QE2w5x5NxSUD+mJDiaLLwAkPt0Ew0
        WLGcWw2YSTg73fXFOGsugiWAOm6h48LjyYpdISI=
X-Google-Smtp-Source: AGRyM1veOVKvmu/b5RrrDM8/fYBGX7fUBqU4wDLmT71UUlESCe/TsS6SK8MUJjAYdFCUdw4EVveYWPb/rfK6QSkcSM4=
X-Received: by 2002:a17:906:a402:b0:72b:8e6e:64ea with SMTP id
 l2-20020a170906a40200b0072b8e6e64eamr14726142ejz.469.1658845309629; Tue, 26
 Jul 2022 07:21:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:241b:0:0:0:0 with HTTP; Tue, 26 Jul 2022 07:21:49
 -0700 (PDT)
Reply-To: clmloans9@gmail.com
From:   MR ANTHONY EDWARD <zayyanusaidu009@gmail.com>
Date:   Tue, 26 Jul 2022 15:21:49 +0100
Message-ID: <CADM+8wSoMon4UwTNHD1_W+tjPLPo1pZPuBbx3PHESBbBOARKEw@mail.gmail.com>
Subject: SICHERES KREDITANGEBOT BEI 2%
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [clmloans9[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [zayyanusaidu009[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [zayyanusaidu009[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Ben=C3=B6tigen Sie ein Gesch=C3=A4ftsdarlehen oder ein Darlehen jeglicher A=
rt?
Wenn ja, kontaktieren Sie uns

*Vollst=C3=A4ndiger Name:
* Ben=C3=B6tigte Menge:
*Leihdauer:
*Mobiltelefon:
*Land:
