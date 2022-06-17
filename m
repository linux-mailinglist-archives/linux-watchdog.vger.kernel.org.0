Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16B3D54F675
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jun 2022 13:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382309AbiFQLLg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jun 2022 07:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381058AbiFQLLf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jun 2022 07:11:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B0E6CA89
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jun 2022 04:11:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b7so4369914ljr.6
        for <linux-watchdog@vger.kernel.org>; Fri, 17 Jun 2022 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=G/dSTlUqlH2258VvjhhJrMT0OtB618hVwgGDjs7n9i870J11YZQC2fCbflI0c5Dhdt
         MUstXjNrYuDJp786lJze9KH9x/Y0MytV03GmEkcsrXGWTixlIxqKKsHLs8fM3m7lT1SU
         89YBCRlP2MCkxqpMu/sb2Dbde1NCU2xJEZPznAvn3WR7ZEhpi0LXQ7rnU46F7lo1kEnI
         cctspph/UXeMMqAbeEKJN3EuO1EfBCkhsI+ENGXXnmSS5PVmi6r+6BSb6mQnCD7kuQxk
         nxxh5peOLJDNkIhYXY8VoAH4wDrMBcP9dL/D0SFFc2XGOFz/1Vd8kwTdKc2E+5ZF612y
         iigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=arHo+hJXNaD7unOA3zWXEbFQImbRr47G9LiG+e5sNNXsXx0CHkdMuuUHhLAWy2+cFC
         fZKqvrvI9ZVuMpHgOhiNNJ5KZrOFnlrgvc52YkwNGEP0hw+z/TRh3ZV6DGllcDBp9G4H
         RU6HHs7qFKJvhpPZWpocsQ/OKEvCEjKoOm7086c01lxWTPqsS9mzahnPSZ40nw2MEMgL
         2FOpwTAV/8lFdsuBmH64N8mPqOat6FlVNjHZQNMZfxCJYRJc82OXYaiMlGirNTEgwyp0
         wuR0HxnS3ZfWII8/foYZqYWL9GDHif/kCZwpmyYn2lLKguybtBYmVJN0RR8MykRRdwj7
         hJ7A==
X-Gm-Message-State: AJIora+Saors1TjIG1JT2IpgCZ2TuUVPNgEvUh0wuOW84MZr2QV9iUdq
        sE91IbzRefxeE7NFrlfHe/UhjTFLb5hrdFNNVzM=
X-Google-Smtp-Source: AGRyM1tYOIEK9rvirUG4+gF7NsJ6+6XoK4ub+ELWclsgzYPMHN5SGnpC2e4sFZaOT+SRNV3yoC5G5coTyj9avBBksv8=
X-Received: by 2002:a05:651c:1549:b0:257:42aa:2421 with SMTP id
 y9-20020a05651c154900b0025742aa2421mr4762965ljp.151.1655464292704; Fri, 17
 Jun 2022 04:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:680f:0:0:0:0:0 with HTTP; Fri, 17 Jun 2022 04:11:32
 -0700 (PDT)
Reply-To: sj7209917@gmail.com
From:   Joseph smith <maelyskpeta@gmail.com>
Date:   Fri, 17 Jun 2022 04:11:32 -0700
Message-ID: <CACKGxpyoMOts=5RFmMf+deoWONaYxGf5U2n=xN33P+mpZvTx0g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi   are you available to  speak now
Thanks
