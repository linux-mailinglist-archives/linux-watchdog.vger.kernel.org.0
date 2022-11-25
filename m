Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CED863878F
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Nov 2022 11:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiKYKbo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Nov 2022 05:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiKYKbn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Nov 2022 05:31:43 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F384D1F606
        for <linux-watchdog@vger.kernel.org>; Fri, 25 Nov 2022 02:31:41 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id 124so3772166vsv.4
        for <linux-watchdog@vger.kernel.org>; Fri, 25 Nov 2022 02:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rS9CXu9crmOhBhNUTAMYdslX03BFIHsj+OOg6ZuWRlI=;
        b=K3uxWVnHM+S/sIqGGZpD2XZtzo0YjvW9fIHBEPF2tP2u+6iQ/8J328KaUuGjftN7I9
         BQBY3hP0IFKh6f87AindkewYOn7FC6SjDWtOIqCMmNY3+wm9SqbeKLkAiLhrCuuKRptl
         Eg3FvEZ416PbUyud7VZUNwnJ/r8gW8MIPJs0cDG7mvCEIRqgkYzKaV6fjcCs8I3MAYsb
         nZyAPjj0tOlS0eqL1qqPQ3vTStJWM4Wqljr/Pstt/6UCfHxzIvyRFPW9Re/cFlzZcXx0
         MCf9MFJ9S6EW526PnDLFm/CSKTFdha9EtG7JttBSXby8z1xiMdFyZm5IFY+o4QUJx/4l
         EoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rS9CXu9crmOhBhNUTAMYdslX03BFIHsj+OOg6ZuWRlI=;
        b=6O6k1j5yqqtKNdvffwn0Egt6KqQGOapvRAChuckJI86Gr834JKL7sukXahEZ453Uik
         3sbUN8mVMLEXeEgGrKXDRbbTTWXDOr7LjFN+Qt90SPnR4WUlbYm9XDVixLWtU+pNqDmM
         VfrUBWNOgmubdLse9Q8HmvK18Gpiw/1OMXZY05pTakEGJ4RP6+l0kQupwqViL5Uuhepd
         Nz9ndJlZswWkWSt5XMPzl1B1lm2h7G16vRXXMfNHSSBv+yhHAvLfiWXy+kV8cwd/v06F
         YjbnSAnbcTnpOIjgW46RZyfWw3e3axO94YGZKbn7WBsf/1YwKJzAEzeQZVzYo+Z0mSrU
         7oxQ==
X-Gm-Message-State: ANoB5pleD8//Z36y5axpP4SzRM7ih3rfVDrilPCx+SUChw9sjCmMO44z
        XFUrc2PeDC+0N8ScOCpMuI98+l89C3nxV1vi5ak=
X-Google-Smtp-Source: AA0mqf7D9vYBTmmpPrPeh7G7aaGYQjg//iMfCSqyvK6mSffsNqkilxXQNjjRsxpLKXpWAgZEYwXdtzgZHivdJLZqaFE=
X-Received: by 2002:a05:6102:3e29:b0:3aa:329d:540e with SMTP id
 j41-20020a0561023e2900b003aa329d540emr11441662vsv.77.1669372300925; Fri, 25
 Nov 2022 02:31:40 -0800 (PST)
MIME-Version: 1.0
Sender: dorisakinyi041@gmail.com
Received: by 2002:a59:c3cc:0:b0:32b:432b:553c with HTTP; Fri, 25 Nov 2022
 02:31:40 -0800 (PST)
From:   Richard Wahl <richardwahl114@gmail.com>
Date:   Fri, 25 Nov 2022 02:31:40 -0800
X-Google-Sender-Auth: 3MgA8Nm2cvFKUF9RNAMRwFn824k
Message-ID: <CAMaWkzaJx4-woRsB=fbsNwX9hmM-gDyygz92Wn7+OMa=woFb_Q@mail.gmail.com>
Subject: Sie haben 1.200.000 Euro Angebot
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

--=20
Gute Nachrichten!!!

Ich bin Herr Richard Wahl, Sie haben Spendengelder schnellstm=C3=B6glich
einzufordern. Antworten Sie jetzt f=C3=BCr weitere Details
